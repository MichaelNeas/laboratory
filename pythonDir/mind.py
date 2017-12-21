def q(a):     
if len(a)<2:return a     
	m=a[int(len(a)/2)]     
return q([x for x in a if x<m])+[x for x in a if x==m]+q([x for x in a if x>m])