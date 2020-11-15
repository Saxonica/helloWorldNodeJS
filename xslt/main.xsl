<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="map xs"
                version="3.0">

<xsl:output method="xml" encoding="utf-8" indent="no"/>

<xsl:param name="payload" as="map(*)?" select="()"/>

<xsl:template name="xsl:initial-template">
  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>Hello, world</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    </head>
    <body>
      <xsl:choose>
        <xsl:when test="exists($payload)">
          <h1>Hello, JSON</h1>
          <dl>
            <xsl:for-each select="map:keys($payload)">
              <dt>
                <xsl:sequence select="."/>
              </dt>
              <dd>
                <xsl:sequence select="map:get($payload, .)"/>
              </dd>
            </xsl:for-each>
          </dl>
        </xsl:when>
        <xsl:otherwise>
          <h1>Hello, World</h1>
          <p>This text comes from the stylesheet.</p>
        </xsl:otherwise>
      </xsl:choose>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>
