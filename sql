select sites.domain,a.email, b.email, sites.id, b.first_name, b.last_name
from accounts a left join accounts b on b.manager_id=a.id left join sites on sites.account_id=b.id
where sites.id in 
(select distinct s.id 
from sites s inner join invoices on invoices.site_id=s.id 
where is_test=false and date(paid_at) between current_date-200 and current_date)
