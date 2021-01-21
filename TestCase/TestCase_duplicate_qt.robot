*** Settings ***
Library     Selenium2Library   implicit_wait=60  timeout=60

*** Variables ***
#Value

${row_serial}                   .datatable-row-center .datatable-body-cell:nth-child(3)
${more_menu}                    .datatable-row-center .datatable-body-cell:nth-child(7) .btn-more
${more_menu_duplicate}          //*[text()[contains(.,'สร้างซ้ำ')]]
${serial_number}                css:.div-head-title .headtitle-text             

#Element

*** Keywords ***
# Function
สร้างเอกสารซ้ำ  
    ${count} =  Get Element Count   css:.datatable-row-wrapper .datatable-row-center 

    FOR  ${i}   IN RANGE  1   ${count+1}

        ${get_value}    Get Text    css:.datatable-row-wrapper:nth-child(${i}) ${row_serial}    

        Run Keyword If  '${get_value}'=='QT2021010001'   Click Element  css:.datatable-row-wrapper:nth-child(${i}) ${more_menu} 

    END

    Click Element           ${more_menu_duplicate}

ตรวจสอบเอกสารสร้างซ้ำ

    ${document_serial}          Get Text                    ${serial_number}
    Should be equal             ${document_serial}          QT2021010002

