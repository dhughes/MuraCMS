
	<cfset request.layout=false>
	<cfif len(rc.sizeid)>
		<cfswitch expression="#rc.imageAction#">
			<cfcase value="delete">
				 <cfset application.serviceFactory.getBean('imageSize').loadBy(sizeid=rc.sizeid).delete()>
			</cfcase>
			<cfcase value="save">
				 <cfset application.serviceFactory.getBean('imageSize').loadBy(sizeid=rc.sizeid).set(rc).save()>
			</cfcase>
		</cfswitch>
	</cfif>

	<cfset images=application.settingsManager.getSite(rc.siteid).getCustomImageSizeIterator()>

<cfoutput>
<!---
SizeID:#rc.sizeid#<br/>
imageAction:#rc.imageAction#<br/>
name:#rc.name#<br/>
height:#rc.height#<br/>
width:#rc.width#<br/>
--->
<cfif images.hasNext()>
<table class="table table-striped table-condensed table-bordered mura-table-grid">
<tr>
<th >Name</th>
<th>Height</th>
<th>Width</th>
<th class="actions"></th>
</tr>
<cfloop condition="images.hasNext()">
<cfset image=images.next()>
<tr>
<td class="var-width">#HTMLEditFormat(image.getName())#</td>
<td>#HTMLEditFormat(image.getHeight())#</td>
<td>#HTMLEditFormat(image.getWidth())#</td>
<td class="actions"><ul class="one">
	<li class="edit"><a href="##" text="Edit" onclick="return openCustomImageSize('#image.getSizeID()#','#JSStringFormat(image.getSiteID())#');">Edit</a></li>
</ul></td>
</tr>
</cfloop>
</table>
<cfelse>
	<p class="notice">There are currently no custom image sizes.</p>
</cfif>
</cfoutput>