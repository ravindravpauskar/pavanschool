<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
		version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
		exclude-result-prefixes="sitemap"
		>

	<xsl:output method="html" encoding="UTF-8" indent="yes" />

	<!--
	  Set variables for whether lastmod, changefreq or priority occur for any url in the sitemap.
	  We do this up front because it can be expensive in a large sitemap.
	  -->
	<xsl:variable name="has-lastmod"    select="count( /sitemap:urlset/sitemap:url/sitemap:lastmod )"    />
	<xsl:variable name="has-changefreq" select="count( /sitemap:urlset/sitemap:url/sitemap:changefreq )" />
	<xsl:variable name="has-priority"   select="count( /sitemap:urlset/sitemap:url/sitemap:priority )"   />

	<xsl:template match="/">
		<html lang="en-US">
			<head>
<meta http-equiv="Last-Modified" content="Tue, 19 Jul 2022 08:36:11 GMT" />
				<title>XML Sitemap</title>
				<style>
					
					body {
						font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
						color: #444;
					}

					#sitemap {
						max-width: 980px;
						margin: 0 auto;
					}

					#sitemap__table {
						width: 100%;
						border: solid 1px #ccc;
						border-collapse: collapse;
					}

			 		#sitemap__table tr td.loc {
						/*
						 * URLs should always be LTR.
						 * See https://core.trac.wordpress.org/ticket/16834
						 * and https://core.trac.wordpress.org/ticket/49949
						 */
						direction: ltr;
					}

					#sitemap__table tr th {
						text-align: left;
					}

					#sitemap__table tr td,
					#sitemap__table tr th {
						padding: 10px;
					}

					#sitemap__table tr:nth-child(odd) td {
						background-color: #eee;
					}

					a:hover {
						text-decoration: none;
					}

				</style>
			</head>
			<body>
				<div id="sitemap">
					<div id="sitemap__header">
						<h1>XML Sitemap</h1>
						<p>This XML Sitemap is generated by WordPress to make your content more visible for search engines.</p>
						<p><a href="https://www.sitemaps.org/">Learn more about XML sitemaps.</a></p>
					</div>
					<div id="sitemap__content">
						<p class="text">Number of URLs in this XML Sitemap: <xsl:value-of select="count( sitemap:urlset/sitemap:url )" />.</p>
						<table id="sitemap__table">
							<thead>
								<tr>
									<th class="loc">URL</th>
									<xsl:if test="$has-lastmod">
										<th class="lastmod">Last Modified</th>
									</xsl:if>
									<xsl:if test="$has-changefreq">
										<th class="changefreq">Change Frequency</th>
									</xsl:if>
									<xsl:if test="$has-priority">
										<th class="priority">Priority</th>
									</xsl:if>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="sitemap:urlset/sitemap:url">
									<tr>
										<td class="loc"><a href="{sitemap:loc}"><xsl:value-of select="sitemap:loc" /></a></td>
										<xsl:if test="$has-lastmod">
											<td class="lastmod"><xsl:value-of select="sitemap:lastmod" /></td>
										</xsl:if>
										<xsl:if test="$has-changefreq">
											<td class="changefreq"><xsl:value-of select="sitemap:changefreq" /></td>
										</xsl:if>
										<xsl:if test="$has-priority">
											<td class="priority"><xsl:value-of select="sitemap:priority" /></td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
