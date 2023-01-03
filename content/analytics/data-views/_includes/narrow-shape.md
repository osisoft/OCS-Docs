<p>The narrow table pivots the standard table. Each data field becomes a row comprised of the following columns:</p> 
<ul>
	<li>Index column</li>
	<li>Grouping value column(s)</li>
	<li>Field column, which holds the resolved column label of the field</li>
	<li>Value column, which holds the field value such as the property or metadata value</li>
</ul>
<p>The column label of the index and grouping value columns may vary depending on the resolved label. The Field and Value column labels are not modifiable.</p>
<p>The data view is built vertically by grouping field, if present, then by field.</p>
<p>Data views resolving into multiple data items with the same property ids or names, should use a grouping field or an identifier in order to differentiate the data rows.</p>
