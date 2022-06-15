declare

fora varchar2(200);

begin

EXECUTE IMMEDIATE 'ALTER SESSION SET GLOBAL_NAMES = FALSE';

fora := 'fora';

update sa_bimec.parametros set valor = '201908' where param = 'MES_CARGA';
COMMIT;


SA_BIMEC.BI_CARREGAMENTOS.st01_load_misi_alunos;


end;



------------

select data,tipo,to_char(data,'yyyyMMdd') dia, to_char(data,'hh24miss') hora,msg
from loading_log 
where to_char(data,'yyyyMMdd') = '20190930'
--AND TIPO = 'ERR'
order by to_char(data,'yyyyMMdd') desc,
to_char(data,'hh24miss') asc
;

select count(*) from DW_BIMEC.fact_dsh_alunos_epub_c_voc where id_mes = 201908;

select id_mes, count(id_mes) ss from DW_BIMEC.fact_dsh_alunos_epub_c_voc group by id_mes order by 1 desc;
