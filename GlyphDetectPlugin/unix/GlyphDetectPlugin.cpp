#include <vector>
using std::vector;
#include <algorithm>
using std::sort;
#include <string>
using std::string;
#include <iostream>
using std::clog;
using std::endl;
#include <opencv2/opencv.hpp>
using namespace cv;

static char *str_nullterm(char *str, int len) {
	char *ntstr = (char *) malloc(sizeof(char) * (len + 1));
	strncpy(ntstr, str, len);
	ntstr[len] = '\0';
	return ntstr;
}

extern "C" int sqDetectGlyphs(char *filename, int filenameLen, int **out, int *len)
{
	Mat imgray, imthres;
	OutputArray hierarchy = {};
	vector<vector<Point>> contours;

	char *f = str_nullterm(filename, filenameLen);
	auto im = imread(f);
	free(f);

	if (!im.data)
		return 1;

	cvtColor(im, imgray, CV_BGR2GRAY);
	fastNlMeansDenoising(imgray, imgray, 10);
	erode(imgray, imgray, getStructuringElement(MORPH_RECT, Size(7, 7)));

	threshold(imgray, imthres, 200, 255, THRESH_BINARY);

	findContours(imthres, contours, hierarchy, RETR_TREE, CHAIN_APPROX_SIMPLE, Point(0, 0));

	vector<vector<Point>> contours_poly(contours.size());
	vector<Rect> boundRect(contours.size());

	for (unsigned int i = 0; i < contours.size(); i++) {
		approxPolyDP(Mat(contours[i]), contours_poly[i], 3, true);
		boundRect[i] = boundingRect(Mat(contours_poly[i]));
	}

	auto maxArea = im.rows * im.cols * 0.8;
	boundRect.erase(std::remove_if(boundRect.begin(), boundRect.end(), [maxArea] (Rect &rect) {
		return rect.area() > maxArea;
	}), boundRect.end());

	boundRect.erase(std::remove_if(boundRect.begin(), boundRect.end(), [&boundRect] (Rect &inside) {
		for (auto &outside : boundRect) {
			if (outside.contains(inside.tl()) && outside.contains(inside.br()))
				return true;
		}
		return false;
	}), boundRect.end());

	*out = (int *) malloc(sizeof(int) * 4 * boundRect.size());
	*len = boundRect.size();

	if (!*out)
		return 1;

	for (unsigned int i = 0; i < boundRect.size() * 4; i += 4) {
		(*out)[i + 0] = boundRect[i].tl().x;
		(*out)[i + 1] = boundRect[i].tl().y;
		(*out)[i + 2] = boundRect[i].br().x;
		(*out)[i + 3] = boundRect[i].br().y;
	}

	return 0;
}


