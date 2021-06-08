const mariadb = require('mariadb');
const pool = mariadb.createPool({
    host: '127.0.0.1',
    user:'root',
    password: 'root',
    database: 'mariadb',
    connectionLimit: 5
});

const sql = "SELECT book_name, library_location FROM books LEFT JOIN libraries ON books.library_id = libraries.library_id WHERE book_name LIKE CONCAT('%', ? , '%')";


async function run() {
    let conn;
    try {

        conn = await pool.getConnection();
        let arg = process.argv[2];
        const rows = await conn.query(sql, [arg]);
        console.log(rows[0].book_name, '(' +rows[0].library_location+ ')');

    } catch (err) {
        throw err;
    } finally {
        if (conn) conn.release(); //release to pool
    }
}

run();
