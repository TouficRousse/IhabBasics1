/// <summary>
/// XmlPort Ihab Customer Recurring Item (ID 50800).
/// </summary>
xmlport 50800 "Ihab Customer Recurring Item"
{
    Caption = 'Ihab Customer Recurring Item';
    Direction = Export;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(CustomerRecurringItem; "Customer Recurring Item")
            {
                fieldelement(CustomerNo; CustomerRecurringItem."Customer No.")
                {
                }
                fieldelement(Description; CustomerRecurringItem.Description)
                {
                }
                fieldelement(ItemNo; CustomerRecurringItem."Item No.")
                {
                }
                fieldelement(Quantity; CustomerRecurringItem.Quantity)
                {
                }
                fieldelement(UnitOfMeasureCode; CustomerRecurringItem."Unit Of Measure Code")
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
    }
}
