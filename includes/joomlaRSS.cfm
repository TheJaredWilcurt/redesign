<cfscript>
function stripHTML(str) {
return REReplaceNoCase(str,"<[^>]*>","","ALL");
}
</cfscript>

<cfif isdefined("url.building")>
	<cfswitch expression="#url.building#">
    <cfcase value="bes">
        <cfset feedURL = "http://joomla.cpcsc.k12.in.us/index.php/categories/81-news/bes?format=feed&type=rss">
		<p>Feed Location: bes</p>
    </cfcase>
    <cfcase value="ces">
        <cfset feedURL = "http://joomla.cpcsc.k12.in.us/index.php/categories/85-news/ces?format=feed&type=rss">
		<p>Feed Location: ces</p>
    </cfcase>
    <cfcase value="pces">
        <cfset feedURL = "http://joomla.cpcsc.k12.in.us/index.php/categories/86-news/pces?format=feed&type=rss">
		<p>Feed Location: pces</p>
    </cfcase>
    <cfcase value="swe">
        <cfset feedURL = "http://joomla.cpcsc.k12.in.us/index.php/categories/87-news/swe?format=feed&type=rss">
		<p>Feed Location: swe</p>
    </cfcase>
    <cfcase value="wes">
        <cfset feedURL = "http://joomla.cpcsc.k12.in.us/index.php/categories/88-news/wes?format=feed&type=rss">
		<p>Feed Location: wes</p>
    </cfcase>
	<cfcase value="cpi">
        <cfset feedURL = "http://joomla.cpcsc.k12.in.us/index.php/categories/82-news/cpi?format=feed&type=rss">
		<p>Feed Location: cpi</p>
    </cfcase>
    <cfcase value="cpms">
        <cfset feedURL = "http://joomla.cpcsc.k12.in.us/index.php/categories/89-news/cpms?format=feed&type=rss">
		<p>Feed Location: cpms</p>
    </cfcase>
    <cfcase value="wchs">
        <cfset feedURL = "http://joomla.cpcsc.k12.in.us/index.php/categories/90-news/wchs?format=feed&type=rss">
		<!---<cfset feedURL = "http://pipes.yahoo.com/pipes/pipe.run?_id=b4c4a1f08e0246548f8c097357344fcf&_render=rss">--->
		<p>Feed Location: wchs</p>
    </cfcase>
    <cfcase value="cpa">
        <cfset feedURL = "http://joomla.cpcsc.k12.in.us/index.php/categories/91-news/cpa?format=feed&type=rss">
		<p>Feed Location: cpa</p>
    </cfcase>
    <cfcase value="wchs9">
        <cfset feedURL = "http://joomla.cpcsc.k12.in.us/index.php/categories/92-news/wchs9?format=feed&type=rss">
		<p>Feed Location: wchs9</p>
    </cfcase>
    <cfdefaultcase>
        <cfset feedURL = "http://joomla.cpcsc.k12.in.us/?format=feed&type=rss">
		<p>Feed Location: Featured/corp</p>
    </cfdefaultcase>
</cfswitch>
<cfelse>
	<cfset feedURL = "http://joomla.cpcsc.k12.in.us/?format=feed&type=rss">
	<p>Feed Location: Featured/corp</p>
</cfif>
<cffeed action="read" source="#feedURL#" query="buildingFeed" properties="info">
<cffeed action="read" source="http://joomla.cpcsc.k12.in.us/index.php/categories/79-news/global?format=feed&type=rss" query="globalFeed" properties="info">



<ul>
<div id="feedContent">

<cfoutput query="buildingFeed">
	<cfset sanitary = stripHTML(#content#)>
	<li><a href="#rsslink#">#title#</a><br/>
		<cfif len(sanitary) gt 100>
			#mid(sanitary,1,100)#...(<a href="#rsslink#">Read More</a>)
		<cfelse>
    		#sanitary#&nbsp;(<a href="#rsslink#">Read More</a>)
		</cfif>
	</li>
</cfoutput>
<cfoutput query="globalFeed">
	<cfset sanitary = stripHTML(#content#)>
	<li><a href="#rsslink#">#title#</a><br/>
		<cfif len(sanitary) gt 100>
			#mid(sanitary,1,100)#...(<a href="#rsslink#">Read More</a>)
		<cfelse>
    		#sanitary#&nbsp;(<a href="#rsslink#">Read More</a>)
		</cfif>
	</li>
</cfoutput>
</div>
</ul>