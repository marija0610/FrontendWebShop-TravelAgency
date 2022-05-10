codeunit 50300 "CreateSalesInvoice"
{
    trigger OnRun()
    var
        SalesHeader: Record "Sales Header";
    begin


        CreateSalesHeader(SalesHeader, '20000');//102001 //01121212
        CreateSalesLine(SalesHeader, '1000', 0);


    end;


    local procedure CreateSalesHeader(var SalesHeader: Record "Sales Header"; CustomerNo: Code[20])
    begin
        SalesHeader.Init();
        SalesHeader."Document Type" := "Sales Document Type"::Invoice;
        SalesHeader."No." := ''; //ako je No.='' odlazi u brojcanu seriju i dohvata No.
        SalesHeader.Insert(true);

        SalesHeader.Validate(SalesHeader."Sell-to Customer No.", CustomerNo);
        SalesHeader.Modify(true);
        Page.Run(Page::"Sales Invoice", SalesHeader);
    end;

    local procedure CreateSalesLine(var SalesHeader: Record "Sales Header"; ItemNumber: Code[20]; LineNo: Integer)
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.Init();
        SalesLine."Line No." := LineNo;
        SalesLine."Document No." := SalesHeader."No.";
        SalesLine."Document Type" := "Sales Document Type"::Invoice;
        SalesLine.Insert(true);
        SalesLine.Validate(Type, "Sales Line Type"::Item);
        SalesLine.Validate("No.", ItemNumber);
        SalesLine.Validate(Quantity, 1);
        SalesLine.Modify(true);

        Page.Run(Page::"Sales Invoice", SalesHeader);
    end;
}
