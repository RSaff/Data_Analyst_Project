-- 1. PRODUKTIVITAS SALES
SELECT 
    p.nama_pegawai,
    COUNT(DISTINCT s.no_so) AS jumlah_so,
    p.target,
    CASE
        WHEN COUNT(DISTINCT s.no_so) < p.target THEN 'ya'
        ELSE 'tidak'
    END AS kurang_dari_target
FROM 
    tr_so s
LEFT JOIN 
    ms_pegawai p on s.kode_sales = p.kode_pegawai
    AND month(s.tgl_so) = 01
GROUP BY 
    p.kode_pegawai
ORDER BY 
    p.nama_pegawai;    

-- 2. LAPORAN DELIVERY ORDER
SELECT
    d.no_do,
    s.kode_customer,
    d.tgl_do,
    CASE
        WHEN s.satuan = 'Krat' THEN (s.qty * 24)
        WHEN s.satuan = 'Dus' THEN (s.qty * 30)
        ELSE s.qty
    END AS qty,
    ROUND(SUM(
        CASE
            WHEN s.satuan = 'Krat' THEN ((s.qty * 24) * p.harga_satuan)
            WHEN s.satuan = 'Dus' THEN ((s.qty * 30) * p.harga_satuan)
            ELSE (s.qty * p.harga_satuan)
        END * 1.1 
    ) + c.ongkos_kirim, 0) AS amount
FROM
    tr_do d
LEFT JOIN
    tr_so s ON d.no_entry_so = s.no_entry_so
INNER JOIN
    ms_product p ON s.kode_barang = p.kode_produk
INNER JOIN
    ms_customer c ON s.kode_customer = c.kode_customer
GROUP BY
    d.no_do, s.kode_customer, d.tgl_do
ORDER BY
    d.no_do;
    
-- 3. LAPORAN UMUR UTANG PELANGGAN
SELECT
	d.no_do,
	nama_customer,
	d.tgl_do,
	'2018-02-01' AS date_measurement,
	DATEDIFF('2018-02-01', d.tgl_do) AS aging 
FROM 
	tr_inv i
RIGHT JOIN 
	tr_do d on i.no_entry_do = d.no_entry_do 
INNER JOIN
	tr_so s ON d.no_entry_so = s.no_entry_so 
INNER JOIN 	
	ms_customer c ON s.kode_customer = c.kode_customer 
WHERE 
	i.no_inv IS NULL 
ORDER BY 
	aging DESC, d.no_do;
    
-- 4. TIGA PRODUK PALING LARIS BERDASARKAN KUANTITAS
SELECT 
    p.nama_product,
    SUM(CASE 
            WHEN s.satuan = 'Krat' THEN s.qty * 24
            WHEN s.satuan = 'Dus' THEN s.qty * 30
            ELSE s.qty
        END) AS qty
FROM 
    tr_so s
INNER JOIN 
    ms_product p ON s.kode_barang = p.kode_produk
GROUP BY 
    p.nama_product
ORDER BY 
    qty DESC, 
    nama_product ASC
LIMIT 3;

-- 5. TIGA VENDOR PALING BANYAK MENJUAL
SELECT 
    v.vendor,
    SUM(
        CASE 
            WHEN s.satuan = 'Krat' THEN s.qty * 24 * p.harga_satuan
            WHEN s.satuan = 'Dus' THEN s.qty * 30 * p.harga_satuan
            ELSE s.qty * p.harga_satuan
        END
    ) AS amount
FROM
    tr_inv i
INNER JOIN 
    tr_do d ON i.no_entry_do = d.no_entry_do
INNER JOIN 
    tr_so s ON d.no_entry_so = s.no_entry_so
INNER JOIN 
    ms_product p ON s.kode_barang = p.kode_produk
INNER JOIN 
    ms_vendor v ON p.kode_vendor = v.kode_vendor
GROUP BY 
    v.vendor
ORDER BY
    amount DESC,
    v.vendor ASC
LIMIT 3;
