codeunit 50302 "SendHotel"
{
    TableNo = Item;
    trigger OnRun()
    var
        WSGetCompanies: Codeunit WSGetCompanies;
        UrlItemLbl: Label '%1/companies(%2)/items', Comment = '%1: base url, %2: company id.';
        CompanyId: Text;
        ItemId: Text;

    begin
        CompanyId := WSGetCompanies.GetCompanyId('Travel Agency');
        ItemId := SendItem(StrSubstNo(UrlItemLbl, WSGetCompanies.GetBaseURL(), CompanyId), ItemContent(Rec."No.", Rec.Description, Rec."Item Category Code"));
    end;

    local procedure SendItem(url: Text; content: Text): Text
    var
        WSGetCompanies: Codeunit WSGetCompanies;
        JsonObjectDocument: JsonObject;
        JsonToken: JsonToken;
    begin
        WSGetCompanies.PostMethod(url, content, JsonObjectDocument);
        JsonObjectDocument.Get('id', JsonToken);
        exit(JsonToken.AsValue().AsText());
    end;

    local procedure ItemContent(No: Code[20]; Description: Text[250]; ItemCategoryCode: Text[100]) Result: Text
    var
        JsonDocument: JsonObject;
    begin
        JsonDocument.Add('number', No);
        JsonDocument.Add('displayName', Description);
        JsonDocument.WriteTo(Result);
    end;
}