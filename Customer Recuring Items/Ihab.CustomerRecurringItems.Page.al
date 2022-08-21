/// <summary>
/// Page Customer Recurring Items (ID 50821).
/// </summary>
page 50821 "Customer Recurring Items"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Customer Recurring Item";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'Cutomer Recurring Item';
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. Field';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. Field';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description Field';
                }
                field("Unit Of Measure Code"; Rec."Unit Of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Of Measure Code Field';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity Field';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

            action(ImportExport)
            {
                Caption = 'Import / Export XML';
                ApplicationArea = All;
                Image = XMLFile;
                RunObject = xmlport "Ihab Customer Recurring Item";
            }
            action(ImportExcel)
            {
                Caption = 'Import From Excel';
                ApplicationArea = All;
                Image = Import;
                trigger OnAction()
                var
                    //    Buffer: Record "Excel Buffer" temporary;
                    CustomerRecurringItem: Record "Customer Recurring Item";
                //   InS: InStream;
                //    FileName: Text;
                //    i: Integer;
                //    Row: Integer;
                //    Col: Integer;
                //    FirstRow: Integer;
                //    LastRow: Integer;
                //    FirstColumn: Integer;
                //    LastColumn: Integer;
                //    ItemsList: List of [Code[20]];
                //    CustomerIDList: List of [Code[20]];
                //    CustomersItemsList: List of [Code[20]];
                //    CustomersAndItemsRec: Code[20];

                begin
                    ImportExceltoTable(CustomerRecurringItem);
                    //    if UploadIntoStream('Import Excel File', '', '', FileName, Ins) then begin
                    //        Buffer.OpenBookStream(InS, 'Sheet1');
                    //        Buffer.ReadSheet();
                    //        Buffer.FindFirst();
                    //        FirstRow := Buffer."Row No.";
                    //        FirstColumn := Buffer."Column No.";
                    //        Buffer.FindLast();
                    //        LastRow := Buffer."Row No.";
                    //        LastColumn := Buffer."Column No.";
                    //        Buffer.Reset();

                    //Message(format(Rec.Count));
                    //CustomerRecurringItem.SetRange("Customer No.", Rec."Customer No.");
                    //        if (CustomerRecurringItem.FindSet()) then begin
                    //            repeat
                    //                CustomersItemsList.Add(CustomerRecurringItem."Customer No." + CustomerRecurringItem."Item No.");
                    //            until CustomerRecurringItem.Next() = 0;
                    //        end;



                    //Message(format(ItemsList.Count));

                    //Message('FirstRow %1', FirstRow);
                    //Message('FirstColumn %1', FirstColumn);
                    //Message('LastRow %1', LastRow);
                    //Message('LastColumn %1', LastColumn);
                    //        For Row := FirstRow + 1 to LastRow do begin
                    //            CustomersAndItemsRec := GetCustomerNo(Buffer, FirstColumn, Row) + GetItemNo(Buffer, FirstColumn + 1, Row);
                    //            if (CustomersItemsList.Contains(CustomersAndItemsRec) <> true) then begin
                    //                CustomerRecurringItem.Init();
                    //                CustomerRecurringItem."Customer No." := GetCustomerNo(Buffer, FirstColumn, Row);
                    //                CustomerRecurringItem."Item No." := GetItemNo(Buffer, FirstColumn + 1, Row);
                    //                CustomerRecurringItem.Description := GetDescription(Buffer, FirstColumn + 2, Row);
                    //                CustomerRecurringItem."Unit Of Measure Code" := GetUnitOfMeasureCode(Buffer, FirstColumn + 3, Row);
                    //                CustomerRecurringItem.Quantity := GetQuantity(Buffer, FirstColumn + 4, Row);
                    //                CustomerRecurringItem.Insert();
                    //            end;

                    //        end;

                    //    end
                end;
                //RunObject = xmlport "Ihab Customer Recurring Item";
                //Message('Hello');

            }
            action(ExportExcel)
            {
                Caption = 'Export to Excel';
                ApplicationArea = All;
                Image = Export;

                trigger OnAction()
                var
                    CustomerRecurringItems: Record "Customer Recurring Item";
                begin
                    if CustomerRecurringItems.FindSet() then begin
                        ExportTableIntoExcel(CustomerRecurringItems);
                    end;
                end;

            }
            action(RefreshFromItemCard)
            {
                Caption = 'Refresh From Item Card';
                ApplicationArea = All;
                Image = RefreshLines;
                trigger OnAction()
                begin
                    RefreshCell();
                end;
            }
        }
    }

    local procedure RefreshCell()

    var
        CellValue: Text;
        Items: Record Item;
        RecurringItems: Record "Customer Recurring Item";

    begin

        //if (Rec.HasFilter) then begin
        //    //Rec.Init();
        //    CellValue := Rec.GetFilter("Item No.");
        //    if Items.Get(CellValue) then
        //        Rec.Description := Items.Description;
        //Rec.Modify(true);
        //end
        //else begin
        RecurringItems.Init();
        RecurringItems.SetRange("Customer No.", Rec."Customer No.");
        //Message(format(RecurringItems.Count));
        if (RecurringItems.FindSet()) then
            repeat
                //Items.SetRange("No.", RecurringItems."Item No.");
                //Message(Format(Items.Count));
                //If (Items.FindSet()) then begin
                if (Items.Get(RecurringItems."Item No.")) then
                    RecurringItems.Description := Items.Description;
                //end;
                RecurringItems.Modify(true);
            until RecurringItems.Next() = 0;

        //end;


    end;

    local procedure GetCustomerNo(var Buffer: Record "Excel Buffer" temporary; Col: Integer; Row: Integer): Code[20]
    begin
        if (Buffer.Get(Row, Col)) then
            exit(Buffer."Cell Value as Text");
    end;

    local procedure GetItemNo(var Buffer: Record "Excel Buffer" temporary; Col: Integer; Row: Integer): Code[20]
    begin
        if (Buffer.Get(Row, Col)) then
            exit(Buffer."Cell Value as Text");
    end;

    local procedure GetDescription(var Buffer: Record "Excel Buffer" temporary; Col: Integer; Row: Integer): Text[100]
    begin
        if (Buffer.Get(Row, Col)) then
            exit(Buffer."Cell Value as Text");
    end;

    local procedure GetUnitOfMeasureCode(var Buffer: Record "Excel Buffer" temporary; Col: Integer; Row: Integer): Code[20]
    begin
        if (Buffer.Get(Row, Col)) then
            exit(Buffer."Cell Value as Text");
    end;

    local procedure GetQuantity(var Buffer: Record "Excel Buffer" temporary; Col: Integer; Row: Integer): Decimal
    var
        D: Decimal;
    begin
        if (Buffer.Get(Row, Col)) then begin
            Evaluate(D, Buffer."Cell Value as Text");
            exit(D);
        end

    end;

    local procedure ImportExceltoTable(var CustRecurringItemsRec: Record "Customer Recurring Item")
    var
        Buffer: Record "Excel Buffer" temporary;
        InS: InStream;
        FileName: Text;
        i: Integer;
        Row: Integer;
        Col: Integer;
        FirstRow: Integer;
        LastRow: Integer;
        FirstColumn: Integer;
        LastColumn: Integer;
        ItemsList: List of [Code[20]];
        CustomerIDList: List of [Code[20]];
        CustomersItemsList: List of [Code[20]];
        CustomersAndItemsRec: Code[20];

    begin
        if UploadIntoStream('Import Excel File', '', '', FileName, Ins) then begin
            Buffer.OpenBookStream(InS, 'Sheet1');
            Buffer.ReadSheet();
            Buffer.FindFirst();
            FirstRow := Buffer."Row No.";
            FirstColumn := Buffer."Column No.";
            Buffer.FindLast();
            LastRow := Buffer."Row No.";
            LastColumn := Buffer."Column No.";
            Buffer.Reset();

            if (CustRecurringItemsRec.FindSet()) then begin
                repeat
                    CustomersItemsList.Add(CustRecurringItemsRec."Customer No." + CustRecurringItemsRec."Item No.");
                until CustRecurringItemsRec.Next() = 0;
            end;

            For Row := FirstRow + 1 to LastRow do begin
                CustomersAndItemsRec := GetCustomerNo(Buffer, FirstColumn, Row) + GetItemNo(Buffer, FirstColumn + 1, Row);
                if (CustomersItemsList.Contains(CustomersAndItemsRec) <> true) then begin
                    CustRecurringItemsRec.Init();
                    CustRecurringItemsRec."Customer No." := GetCustomerNo(Buffer, FirstColumn, Row);
                    CustRecurringItemsRec."Item No." := GetItemNo(Buffer, FirstColumn + 1, Row);
                    CustRecurringItemsRec.Description := GetDescription(Buffer, FirstColumn + 2, Row);
                    CustRecurringItemsRec."Unit Of Measure Code" := GetUnitOfMeasureCode(Buffer, FirstColumn + 3, Row);
                    CustRecurringItemsRec.Quantity := GetQuantity(Buffer, FirstColumn + 4, Row);
                    CustRecurringItemsRec.Insert();
                end;

            end;

        end
    end;


    local procedure ExportTableIntoExcel(var CustRecurringItemsRec: Record "Customer Recurring Item")
    var
        Buffer: Record "Excel Buffer" temporary;
        CustomerRecurringItemsLbl: Label 'CustomerRecurringItems';
        ExcelFileName: Label 'CutomerRecurringItems_%1_%2';

    begin

        Buffer.Reset();
        Buffer.DeleteAll();
        Buffer.NewRow();
        Buffer.AddColumn(CustRecurringItemsRec.FieldCaption("Customer No."), false, '', false, false, false, '', Buffer."Cell Type"::Text);
        Buffer.AddColumn(CustRecurringItemsRec.FieldCaption("Item No."), false, '', false, false, false, '', Buffer."Cell Type"::Text);
        Buffer.AddColumn(CustRecurringItemsRec.FieldCaption(Description), false, '', false, false, false, '', Buffer."Cell Type"::Text);
        Buffer.AddColumn(CustRecurringItemsRec.FieldCaption("Unit Of Measure Code"), false, '', false, false, false, '', Buffer."Cell Type"::Text);
        Buffer.AddColumn(CustRecurringItemsRec.FieldCaption(Quantity), false, '', false, false, false, '', Buffer."Cell Type"::Number);
        if (CustRecurringItemsRec.FindSet()) then
            repeat
                Buffer.NewRow();
                Buffer.AddColumn(CustRecurringItemsRec."Customer No.", false, '', false, false, false, '', Buffer."Cell Type"::Text);
                Buffer.AddColumn(CustRecurringItemsRec."Item No.", false, '', false, false, false, '', Buffer."Cell Type"::Text);
                Buffer.AddColumn(CustRecurringItemsRec.Description, false, '', false, false, false, '', Buffer."Cell Type"::Text);
                Buffer.AddColumn(CustRecurringItemsRec."Unit Of Measure Code", false, '', false, false, false, '', Buffer."Cell Type"::Text);
                Buffer.AddColumn(CustRecurringItemsRec.Quantity, false, '', false, false, false, '', Buffer."Cell Type"::Number);

            until CustRecurringItemsRec.Next() = 0;
        Buffer.CreateNewBook('Sheet1');
        Buffer.WriteSheet(CustomerRecurringItemsLbl, 'Ihab Association', '12345');
        Buffer.CloseBook();
        Buffer.SetFriendlyFilename(StrSubstNo('CutomerRecurringItems_%1_%2', CurrentDateTime, 12345));
        Buffer.OpenExcel();
    end;




    var
        myInt: Integer;
}