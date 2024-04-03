import sqlite3


def write_pattern_to_db(path: str) -> None:

    with sqlite3.connect("db.db") as con:
        cursor = con.cursor()

        with open(path, "rb") as docx:
            file = docx.read()

            cursor.execute("INSERT INTO patterns (patt) VALUES (?)", (file,))

        con.commit()



def read_pattern_from_db(path: str, id: int) -> None:
    
    with sqlite3.connect("db.db") as con:

        cursor = con.cursor()
        data = cursor.execute("SELECT patt FROM patterns WHERE id = ?;", (id, )).fetchone()

        with open(path, "wb") as docx:
            docx.write(data[0])

        con.commit()


# write_pattern_to_db("Pattern.docx")
read_pattern_from_db("patt.docx", 1)
read_pattern_from_db("patt2.docx", 2)
