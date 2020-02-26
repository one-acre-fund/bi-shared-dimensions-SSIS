Create view v_SFEmployee
 as 
select e.*, b.BankBranch 
from sfemployee e
left join SFBank b on e.BankCode=b.BankID


