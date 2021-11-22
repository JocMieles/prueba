import sql from 'mssql';

import keys from './keys' 

async function get(){
    const pool = sql.connect(keys.database);
    const result = await (await pool).request().query("SELECT 1");
    console.log(result);
}

get();
export default get;