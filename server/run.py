from eve import Eve
from eve_sqlalchemy import SQL

import tables

app = Eve(data = SQL)

db = app.data.driver
tables.Base.metadata.bind = db.engine
db.Model = tables.Base
db.create_all()

if not db.session.query(tables.User).count():
    from seed import entities
    for entity in entities:
        db.session.add(entity)
    db.session.commit()

if __name__ == '__main__':
    app.run(debug = True, port = 8000)
