<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:str="http://www.saic.com/precis/2009/06/structures" xmlns:ulex="ulex:message:structure:1.0" xmlns:base="http://www.saic.com/precis/2009/06/base" xmlns:ns="http://ucore.gov/ucore/2.0" xmlns:wmc="http://www.opengis.net/context" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns1="http://www.opengis.net/gml/3.2" exclude-result-prefixes="my" xmlns:my="http://metadata.dod.mil/mdr/ns/DDMS/2.0/">
	<xsl:output version="1.0" method="html" indent="no" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
	<xsl:template match="/">
		<html>
			<head>
				<title/>
			</head>
			<xsl:for-each select="str:WorkProduct">
				<xsl:apply-templates select="ulex:PackageMetadata"/>
				<xsl:apply-templates select="ns:Digest"/>
				<xsl:apply-templates select="ulex:StructuredPayload"/>
			</xsl:for-each>
		</html>
	</xsl:template>
	<!-- -->
	<!-- start of Package Metadata -->
	<!-- -->
	<xsl:template match="ulex:PackageMetadata">
		<table border="1" width="100%">
			<tr>
				<th bgcolor="Blue" colspan="3">Work Product Metadata</th>
			</tr>
			<tbody>
				<xsl:apply-templates select="ulex:DataOwnerMetadata"/>
				<xsl:apply-templates select="str:WorkProductIdentification"/>
				<xsl:apply-templates select="str:WorkProductProperties"/>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="ulex:DataOwnerMetadata">
		<tr bgcolor="SkyBlue">
			<td>Data Owner</td>
			<td>Identifier</td>
			<td>
				<xsl:value-of select="ns:DataOwnerIdentifier/my:Organization/my:name"/>
			</td>
		</tr>
		<tr  bgcolor="SkyBlue">
			<td/>
			<td>Contact</td>
			<td>
				<xsl:value-of select="ns:DataOwnerContact/my:Organization/my:name"/>
			</td>
		</tr>
		<tr  bgcolor="SkyBlue">
			<td/>
			<td>Domain</td>
			<td>
				<xsl:value-of select="ulex:DataOwnerMetadataDomainAttribute/ulex:DomainName"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="str:WorkProductIdentification">
		<tr bgcolor="SkyBlue">
			<td>Work Product Identification</td>
			<td>Product ID</td>
			<td>
				<xsl:value-of select="base:Identifier"/>
			</td>
		</tr>
		<tr bgcolor="SkyBlue">
			<td/>
			<td>Product Type</td>
			<td>
				<xsl:value-of select="base:Type"/>
			</td>
		</tr>
		<tr bgcolor="SkyBlue">
			<td/>
			<td>Product Version</td>
			<td>
				<xsl:value-of select="base:Version"/>
			</td>
		</tr>
		<tr bgcolor="Gainsboro">
			<td/>
			<td>Product Checksum</td>
			<td>
				<xsl:value-of select="base:Checksum"/>
			</td>
		</tr>
		<tr bgcolor="Gainsboro">
			<td/>
			<td>Product State</td>
			<td>
				<xsl:value-of select="base:State"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="str:WorkProductProperties">
		<tr bgcolor="silver">
			<td>Work Product Properties</td>
			<td>Created</td>
			<td>
				<xsl:value-of select="base:Created"/>
			</td>
		</tr>
		<tr bgcolor="silver">
			<td/>
			<td>CreatedBy</td>
			<td>
				<xsl:value-of select="base:CreatedBy"/>
			</td>
		</tr>
		<tr bgcolor="silver">
			<td/>
			<td>LastUpdated</td>
			<td>
				<xsl:value-of select="base:LastUpdated"/>
			</td>
		</tr>
		<tr bgcolor="silver">
			<td/>
			<td>LastUpdatedBy</td>
			<td>
				<xsl:value-of select="base:LastUpdatedBy"/>
			</td>
		</tr>
		<tr bgcolor="silver">
			<td/>
			<td>Kilobytes</td>
			<td>
				<xsl:value-of select="base:Kilobytes"/>
			</td>
		</tr>
		<tr bgcolor="silver">
			<td/>
			<td>MimeType</td>
			<td>
				<xsl:value-of select="base:MimeType"/>
			</td>
		</tr>
		<tr bgcolor="silver">
			<td/>
			<td>Associated Interest Groups</td>
			<td>
				<table frame="void" width="100%">
					<tbody>
						<xsl:for-each select="base:AssociatedGroups/base:Identifier">
							<tr>
								<td>
									<xsl:value-of select="current()"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>
	<!-- -->
	<!-- end of Package Metadata -->
	<!-- -->
	<!-- -->
	<!-- start of Structured Payload -->
	<!-- -->
	<xsl:template match="ulex:StructuredPayload">
		<table border="1" width="100%">
			<tr bgcolor="khaki">
				<th colspan="3">Fractional Data Structured Payload</th>
			</tr>
			<tbody>
				<xsl:apply-templates select="ulex:StructuredPayloadMetadata"/>
				<xsl:apply-templates select="wmc:ViewContext"/>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="ulex:StructuredPayloadMetadata">
		<tr bgcolor="lightyellow">
			<td>Payload Type</td>
			<td>
				<xsl:value-of select="ulex:CommunityURI"/>
			</td>
			<td/>
		</tr>
	</xsl:template>
	<xsl:template match="wmc:ViewContext">
		<tr bgcolor="lightyellow">
			<td>Identifier</td>
			<td>
				<xsl:value-of select="@id"/>
			</td>
			<td/>
		</tr>
		<xsl:apply-templates select="wmc:General"/>
		<xsl:apply-templates select="wmc:LayerList/wmc:Layer"/>
	</xsl:template>
	<xsl:template match="wmc:General">
		<tr bgcolor="lightyellow">
			<td>General Information</td>
			<td>Window</td>
			<td>
				<xsl:apply-templates select="wmc:Window"/>
			</td>
		</tr>
		<tr bgcolor="lightyellow">
			<td/>
			<td>Bounding Box</td>
			<td>
				<xsl:apply-templates select="wmc:BoundingBox"/>
			</td>
		</tr>
		<tr bgcolor="lightyellow">
			<td/>
			<td>Title</td>
			<td>
				<xsl:value-of select="wmc:Title"/>
			</td>
		</tr>
		<tr bgcolor="lightyellow">
			<td/>
			<td>Keywords</td>
			<td>
				<table frame="void" width="100%">
					<tbody>
						<xsl:for-each select="wmc:KeywordList/wmc:Keyword">
							<tr>
								<td>
									<xsl:value-of select="current()"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</td>
		</tr>
		<tr bgcolor="lightyellow">
			<td/>
			<td>Abstract</td>
			<td>
				<xsl:value-of select="wmc:Abstract"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="wmc:Window">
		<table frame="void" width="100%">
			<tbody>
				<tr bgcolor="lightyellow">
					<td>Height</td>
					<td>
						<xsl:value-of select="@height"/>
					</td>
				</tr>
				<tr bgcolor="lightyellow">
					<td>Width</td>
					<td>
						<xsl:value-of select="@width"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="wmc:BoundingBox">
		<table frame="void" width="100%">
			<tbody>
				<tr bgcolor="lightyellow">
					<td>SRS</td>
					<td>
						<xsl:value-of select="@SRS"/>
					</td>
				</tr>
				<tr bgcolor="lightyellow">
					<td>Max X</td>
					<td>
						<xsl:value-of select="@maxx"/>
					</td>
				</tr>
				<tr bgcolor="lightyellow">
					<td>Max Y</td>
					<td>
						<xsl:value-of select="@maxy"/>
					</td>
				</tr>
				<tr bgcolor="lightyellow">
					<td>Min X</td>
					<td>
						<xsl:value-of select="@minx"/>
					</td>
				</tr>
				<tr bgcolor="lightyellow">
					<td>Min Y</td>
					<td>
						<xsl:value-of select="@miny"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="wmc:LayerList/wmc:Layer">
		<tr bgcolor="LemonChiffon">
			<td>Layer</td>
			<td>
				<table frame="void" width="100%">
					<tbody>
						<tr>
							<th colspan="2" align="left">Attributes:</th>
						</tr>
						<tr>
							<td align="left">Hidden:</td>
							<td align="left">
								<xsl:value-of select="@hidden"/>
							</td>
						</tr>
						<tr>
							<td align="left">Queryable:</td>
							<td align="left">
								<xsl:value-of select="@queryable"/>
							</td>
						</tr>
						<tr>
							<td align="left">Name:</td>
							<td align="left">
								<xsl:value-of select="wmc:Name"/>
							</td>
						</tr>
						<tr>
							<td align="left">Title:</td>
							<td align="left">
								<xsl:value-of select="wmc:Title"/>
							</td>
						</tr>
						<tr>
							<td align="left">SRS:</td>
							<td align="left">
								<xsl:value-of select="wmc:SRS"/>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td>
				<xsl:apply-templates select="wmc:Server"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="wmc:Server">
		<table frame="void" width="100%">
			<tbody>
				<tr>
					<th colspan="2" align="left">Server:</th>
				</tr>
				<tr>
					<td>Name</td>
					<td>
						<xsl:value-of select="@service"/>
					</td>
				</tr>
				<tr>
					<td>Title</td>
					<td>
						<xsl:value-of select="@title"/>
					</td>
				</tr>
				<tr>
					<td>Version</td>
					<td>
						<xsl:value-of select="@version"/>
					</td>
				</tr>
				<xsl:apply-templates select="wmc:OnlineResource"/>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="wmc:OnlineResource">
		<tr>
			<td>Online Resource</td>
			<td>
				<xsl:value-of select="@xlink:href"/>
			</td>
		</tr>
	</xsl:template>
	<!-- -->
	<!-- end of Structured Payload -->
	<!-- -->
</xsl:stylesheet>
