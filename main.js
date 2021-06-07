const mariadb = require('mariadb');
const pool = mariadb.createPool({
    host: '127.0.0.1',
    user:'root',
    password: 'root',
    database: 'mariadb',
    connectionLimit: 5
});


async function run() {
    let conn;
    try {

        conn = await pool.getConnection();
        let arg = process.argv[2];
        const rows = await conn.query("SELECT * FROM books WHERE book_name LIKE CONCAT('%', ? , '%')", [arg]);
        console.log(rows[0].book_name, '('+rows[0].library_name+')');

    } catch (err) {
        throw err;
    } finally {
        if (conn) conn.release(); //release to pool
    }
}

run();
