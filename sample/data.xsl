<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"/>

    <xsl:template match="/">



        <html>

            <body>

                <h2 style="text-align:center">프로그래밍 언어</h2>

                <table border="1" style="width: 50%; margin: auto">

                    <tr>

                        <th>이름</th>

                        <th>종류</th>

                        <th>개발사</th>

                        <th>버전</th>

                        <th>중요도</th>

                    </tr>

                    <xsl:for-each select="programming_languages/language">

                        <tr>

                            <td>
                                <xsl:value-of select="name"/>
                            </td>

                            <td>
                                <xsl:value-of select="category"/>
                            </td>

                            <td>
                                <xsl:value-of select="developer"/>
                            </td>

                            <td>
                                <xsl:value-of select="version"/>
                            </td>

                            <td>
                                <xsl:value-of select="priority"/>
                            </td>

                        </tr>

                    </xsl:for-each>

                </table>

            </body>

        </html>



    </xsl:template>

</xsl:stylesheet>