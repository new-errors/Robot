*** Settings ***
Library     Selenium2Library   implicit_wait=60  timeout=60

*** Variables ***
#Value


#Element

*** Keywords ***
# Function
สร้างเอกสารซ้ำ  
    ${count} =  Get Element Count   css:.datatable-row-wrapper .datatable-row-center 
    Log         Connt: ${count}

    FOR     ${index}    IN    2
        # Log         Connt: ${count} and ${i}
        ${get_value}    Get Text    css:.datatable-row-wrapper:nth-child(${index}) .datatable-row-center .datatable-body-cell:nth-child(3) 
        Log         ${get_value} 

        # Run Keyword If  '${get_value}'=='QT2021010001'   Click Element  css:.datatable-row-wrapper:nth-child(${index} ) .datatable-row-center .datatable-body-cell:nth-child(3) 
    END

    # GET       css:.datatable-row-wrapper:nth-child(1) .datatable-row-center .datatable-body-cell:nth-child(3)
    # Click Element


