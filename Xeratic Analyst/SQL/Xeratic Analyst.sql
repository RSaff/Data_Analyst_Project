-- 1. NODE AND POSITION
SELECT 
    n.node,
    CASE 
        WHEN n.parent IS NULL THEN 'Akar'
        WHEN (SELECT COUNT(*) FROM nodes WHERE parent = n.node) = 0 THEN 'Daun'
        ELSE 'Batang'
    END AS position
FROM 
    nodes n
ORDER BY 
    n.node;
    
-- 2. PASANGAN SIMETRIS
SELECT 
    LEAST(X, Y) AS X,
    GREATEST(X, Y) AS Y
FROM 
    xy
WHERE 
    (X, Y) NOT IN (
        SELECT 
            DISTINCT GREATEST(Y, X) AS X,
            LEAST(Y, X) AS Y
        FROM 
            xy
    )
ORDER BY 
    X, Y;
    
-- 3. STRING EXTRACTION
SELECT
    DATE_FORMAT(data.tanggal, '%Y-%m-%d') AS tanggal,
    data.qty,
    1000 AS harga_satuan,
    data.qty * 1000 AS total
FROM (
    SELECT
        CASE
            WHEN strdata LIKE 'Tanggal%' THEN 
                CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(strdata, 'Tanggal ', -1), ' ', 1) AS DATE)
            ELSE CAST(REGEXP_SUBSTR(strdata, '[0-9]{4}-[0-9]{2}-[0-9]{2}') AS DATE)
        END AS tanggal,
        CASE
            WHEN strdata LIKE '%1 lusin%' THEN 12
            WHEN strdata LIKE '%1 buah%' THEN 1
            ELSE CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(strdata, ' terjual ', -1), ' ', 1) AS UNSIGNED)
        END AS qty
    FROM
        strdata
) AS data;

-- 4. SELISIH UMUR 
SELECT 
    CASE WHEN ABS(DATEDIFF(p1.tanggal_registrasi, p1.tanggal_lahir)) > ABS(DATEDIFF(p2.tanggal_registrasi, p2.tanggal_lahir))
         THEN p1.nama
         ELSE p2.nama
    END AS nama1,
    CASE WHEN ABS(DATEDIFF(p1.tanggal_registrasi, p1.tanggal_lahir)) > ABS(DATEDIFF(p2.tanggal_registrasi, p2.tanggal_lahir))
         THEN p2.nama
         ELSE p1.nama
    END AS nama2,
    ABS(DATEDIFF(p1.tanggal_registrasi, p1.tanggal_lahir) - DATEDIFF(p2.tanggal_registrasi, p2.tanggal_lahir)) AS selisih
FROM 
    people p1
JOIN 
    people p2 ON p1.nama > p2.nama
ORDER BY 
    selisih
LIMIT 1;