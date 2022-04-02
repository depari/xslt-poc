<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <script src="https://luke-chang.github.io/js-spatial-navigation/spatial_navigation.js"></script> 
                <script>
                    window.addEventListener('load', function() {
                    // Initialize
                    SpatialNavigation.init();
                
                    // Define navigable elements (anchors and elements with "focusable" class).
                    SpatialNavigation.add({
                        selector: 'a, button, input, .focusable'
                    });
                
                    // Make the *currently existing* navigable elements focusable.
                    SpatialNavigation.makeFocusable();
                
                    // Focus the first navigable element.
                    SpatialNavigation.focus();
                    });
                </script> 
                <style>
                    /* Add style to the focused elements */
                    :focus {
                    outline: 2px solid red;
                    }
                </style> 
                <xsl:apply-templates select="cms_agreement_data/agreement_head"/>
            </head>
            <body>
                <div style="text-align:center">
                    <table border="1" style="width: 80%; margin: auto; text-align:center">
                        <tr>
                            <th>checkbox</th>
                            <th>id</th>
                            <th>title_description</th>
                            <th>detail</th>
                        </tr>
                        <xsl:apply-templates select="cms_agreement_data/agreement_body"/>
                    </table>
                    <div >
                        <xsl:apply-templates select="cms_agreement_data/agreement_tail"/>
                    </div>
                </div>
            </body>
        </html>    
    </xsl:template>

    <xsl:template match="cms_agreement_data/agreement_head">
        <h1 style="text-align:center">
            <xsl:value-of select="title"/>
        </h1>
        <h2 style="text-align:center">
            <xsl:value-of select="desctription"/>
        </h2>
    </xsl:template>

    <xsl:template match="cms_agreement_data/agreement_body">
        <xsl:for-each select="agreement_item">
            <tr>
                <th>
                    <xsl:if test="checkbox='Y'">
                        <xsl:element name="input">
                            <xsl:if test="@checked='true'">
                                <xsl:attribute name="checked">true</xsl:attribute>
                            </xsl:if>
                            <xsl:attribute name="id">
                                <xsl:value-of select="id" />
                            </xsl:attribute>
                            <xsl:attribute name="type">checkbox</xsl:attribute>                            
                        </xsl:element>
                    </xsl:if>
                </th>
                <th>
                    <xsl:value-of select="id"/>
                </th>
                <th style="max-width: 500px;text-align:left">
                    <div>
                        <xsl:value-of select="title"/>
                    </div>
                    <div>
                        <h6>
                            <xsl:value-of select="description"/>
                        </h6>
                    </div>
                    <!-- <xsl:value-of select="description"/> -->
                </th>
                <th>
                    <xsl:element name="button">
                        <xsl:attribute name="id">
                            <xsl:value-of select="id" />
                        </xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="detail/type='url'">
                                <xsl:attribute name="onclick">
                                    <xsl:text>location.href="</xsl:text>
                                    <xsl:value-of select="detail/detail_data" />
                                    <xsl:text>"</xsl:text>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="onclick">
                                    <xsl:text>alert('</xsl:text>
                                    <xsl:value-of select="detail/detail_data" />
                                    <xsl:text>');</xsl:text>
                                </xsl:attribute>                            
                                <!-- <xsl:message terminate="yes">
                                    <xsl:value-of select="detail/detail_data" />
                                </xsl:message> -->
                            </xsl:otherwise>
                        </xsl:choose>                       
                        
                        <xsl:value-of select="detail/button_sid"/>
                    </xsl:element>
                </th>
            </tr>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="cms_agreement_data/agreement_tail">        
        <xsl:if test="agreetoall_button">            
            <xsl:element name="br"/>
            <xsl:element name="input">
                <xsl:if test="@checked='true'">
                    <xsl:attribute name="checked">true</xsl:attribute>
                </xsl:if>
                <xsl:attribute name="id">
                    <xsl:value-of select="id" />
                </xsl:attribute>
                <xsl:attribute name="type">checkbox</xsl:attribute>                
            </xsl:element>            
            <xsl:value-of select="agreetoall_button" /> 
        </xsl:if>

        <xsl:element name="br"/>
        <xsl:element name="br"/>

        <xsl:value-of select="agreement_disclaimer" />

        <xsl:element name="br"/>
        <xsl:element name="br"/>
        
        <xsl:element name="button">
            <xsl:attribute name="id">
                <xsl:value-of select="id" />
            </xsl:attribute>
            <xsl:value-of select="agree_button" />
        </xsl:element>
        <xsl:element name="button">
            <xsl:attribute name="id">
                <xsl:value-of select="id" />
            </xsl:attribute>
            <xsl:value-of select="skip_button" />
        </xsl:element>
        
        

    </xsl:template>    
</xsl:stylesheet>