set PGPASSWORD=hpu qtm qlgd
set hour=%time:~0,2%
if "%time:~0,1%"==" " set hour=0%time:~1,1%
set folder_name=thamdo20152016hk1
set file_name=%folder_name%_%date:~10,4%%date:~4,2%%date:~7,2%_%hour%%time:~3,2%.backup
set backup_folder=\\10.1.0.208\DatabaseBackup\thamdo\%folder_name%\

E:\PostgreSQL\9.3\bin\pg_dump.exe --host localhost --port 5432 --username "postgres" --role "thamdo" --format custom --blobs --verbose --file "E:\dbbackup\thamdo\%folder_name%\%file_name%" "thamdo"

xcopy "E:\dbbackup\thamdo\%folder_name%\%file_name%" "%backup_folder%"
