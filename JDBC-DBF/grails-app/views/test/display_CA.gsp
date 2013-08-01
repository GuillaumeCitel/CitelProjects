Liste du CA par client sur la période ${beginning_date } --- ${end_date }<br/><br/>
<g:each in="${result}" var="row">
${row.SORT}---${row.sum}<br/>
</g:each>