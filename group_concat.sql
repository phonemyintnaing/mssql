--mssql example: similar to 'group-concat' function in mysql


SELECT
      m.maskid
    , m.maskname
    , m.schoolid
    , s.schoolname
    , maskdetail = STUFF((
          SELECT ',' + md.maskdetail
          FROM dbo.maskdetails md
          WHERE m.maskid = md.maskid
          FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '')
FROM dbo.tblmask m
JOIN dbo.school s ON s.ID = m.schoolid
ORDER BY m.maskname
