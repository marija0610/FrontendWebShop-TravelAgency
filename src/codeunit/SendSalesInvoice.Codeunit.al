codeunit 50301 "SendSalesInvoice"
{
    TableNo = Reservation;
    SingleInstance = true;

    trigger OnRun()
    var
        WSGetCompanies: Codeunit WSGetCompanies;
        CompanyId: Text;
        //InvoiceId: Text;
        UrlHeaderLbl: Label '%1/companies(%2)/salesInvoices', Comment = '%1: base url, %2: company id.';
        UrlLineLbl: Label '%1/companies(%2)/salesInvoices(%3)/salesInvoiceLines', Comment = '%1: base url, %2: company id., %3: invoice id';
        UrlPostSalesInvoiceLbl: Label '%1/companies(%2)/salesInvoices(%3)/Microsoft.NAV.post', Comment = '%1: base url, %2: company id., %3: invoice id';
        quantity: Decimal;
    begin
        quantity := (Rec."Ending Date" - Rec."Starting Date") + 1;
        CompanyId := WSGetCompanies.GetCompanyId('Travel Agency');
        InvoiceId := SendSalesHeader(StrSubstNo(UrlHeaderLbl, WSGetCompanies.GetBaseURL(), CompanyId), HeaderContent(Today(), Rec."Customer No."));
        SendSalesLine(StrSubstNo(UrlLineLbl, WSGetCompanies.GetBaseURL(), CompanyId, InvoiceId),
                    LineContent('Item', Rec."Hotel No.", quantity, 'DAY', Rec."Hotel Name", Rec."Unit Price"));
        PostInvoice(StrSubstNo(UrlPostSalesInvoiceLbl, WSGetCompanies.GetBaseURL(), CompanyId, InvoiceId), '');
    end;

    procedure GetInvId(): Text
    begin
        exit(InvoiceId);
    end;


    local procedure SendSalesHeader(url: Text; content: Text): Text
    var
        WSGetCompanies: Codeunit WSGetCompanies;
        JsonObjectDocument: JsonObject;
        JsonToken: JsonToken;
        JsonToken2: JsonToken;
    begin
        WSGetCompanies.PostMethod(url, content, JsonObjectDocument);
        JsonObjectDocument.Get('id', JsonToken);
        JsonObjectDocument.Get('number', JsonToken2);
        InvoiceNo := JsonToken2.AsValue().AsText();
        exit(JsonToken.AsValue().AsText());
    end;

    procedure GetInvNo(): Text
    begin
        exit(InvoiceNo);
    end;

    local procedure SendSalesLine(url: Text; content: Text): Text
    var
        WSGetCompanies: Codeunit WSGetCompanies;
        JsonObjectDocument: JsonObject;
    begin
        WSGetCompanies.PostMethod(url, content, JsonObjectDocument);
    end;

    local procedure PostInvoice(url: Text; content: Text): Text
    var
        WSGetCompanies: Codeunit WSGetCompanies;
        JsonObjectDocument: JsonObject;
    begin
        WSGetCompanies.PostMethodWihoutContent(url, content, JsonObjectDocument);
    end;

    local procedure HeaderContent(PostingDate: Date; CustomerNo: Code[20]) Result: Text
    var
        JsonDocument: JsonObject;
    begin
        JsonDocument.Add('postingDate', PostingDate);
        JsonDocument.Add('customerNumber', CustomerNo);
        JsonDocument.WriteTo(Result);
    end;

    local procedure LineContent(LineType: Text; ItemNo: Code[20]; Qty: Decimal; UnitOfMeasureCode: Text; Description: Text; UnitPrice: Decimal) Result: Text //Qty: Decimal
    var
        JsonDocument: JsonObject;
    begin
        JsonDocument.Add('lineType', LineType);
        JsonDocument.Add('lineObjectNumber', ItemNo);
        JsonDocument.Add('quantity', Qty);
        JsonDocument.Add('description', Description);
        JsonDocument.Add('unitPrice', UnitPrice);
        JsonDocument.Add('unitOfMeasureCode', UnitOfMeasureCode);
        JsonDocument.WriteTo(Result);
    end;

    var
        InvoiceId: Text;
        InvoiceNo: Text;
}
