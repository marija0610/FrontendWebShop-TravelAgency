codeunit 50300 "SendNewCustomer"
{
    TableNo = Customer;
    trigger OnRun()
    var
        WSGetCompanies: Codeunit WSGetCompanies;
        UrlCustomerLbl: Label '%1/companies(%2)/customers', Comment = '%1: base url, %2: company id.';
        CompanyId: Text;
        CustomerId: Text;

    begin
        CompanyId := WSGetCompanies.GetCompanyId('Marija d.o.o.');
        CustomerId := SendCustomer(StrSubstNo(UrlCustomerLbl, WSGetCompanies.GetBaseURL(), CompanyId), CustomerContent(Rec."No.", Rec.Name, Rec."E-Mail"));
    end;

    local procedure SendCustomer(url: Text; content: Text): Text
    var
        WSGetCompanies: Codeunit WSGetCompanies;
        JsonObjectDocument: JsonObject;
        JsonToken: JsonToken;
    begin
        WSGetCompanies.PostMethod(url, content, JsonObjectDocument);
        JsonObjectDocument.Get('id', JsonToken);
        exit(JsonToken.AsValue().AsText());
    end;

    local procedure CustomerContent(No: Code[20]; Name: Text[250]; Email: Text[100]) Result: Text
    var
        JsonDocument: JsonObject;
    begin
        JsonDocument.Add('number', No);
        JsonDocument.Add('displayName', Name);
        JsonDocument.Add('email', Email);
        JsonDocument.WriteTo(Result);
    end;
}