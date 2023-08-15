codeunit 50307 "Create General Journal"
{
    TableNo = Reservation;

    trigger OnRun()
    var
        WSGetCompanies: Codeunit WSGetCompanies;

        CompanyId: Text;
        UrlGenJournalLbl: Label 'http://bc-195-default:7048/BC/api/marija/payment/v1.0/companies(%1)/paymentJournalLines', Comment = '%1: company id.';
        UrlPostGenJorunalLineLbl: Label 'http://bc-195-default:7048/BC/api/marija/payment/v1.0/companies(%1)/paymentJournalLines(%2)/Microsoft.NAV.postJournalLine', Comment = '%1: company id., %2: line id';
        CashPaymentLbl: Label 'Cash payment: %1', Comment = '%1 is Hotel name';
        BankPaymentLbl: Label 'Payment via Bank: %1', Comment = '%1 is Hotel name';
        descriptionCash: Text[200];
        descriptionBank: Text[200];
        cashId: Text;
        cardId: Text;
    begin
        CompanyId := WSGetCompanies.GetCompanyId('Travel Agency');
        descriptionCash := StrSubstNo(CashPaymentLbl, Rec."Hotel Name");
        descriptionBank := StrSubstNo(BankPaymentLbl, Rec."Hotel Name");

        if Rec."Cash payment amount" > 0 then begin
            cashId := SendJournallLine(StrSubstNo(UrlGenJournalLbl, CompanyId),
                    LineContent(Rec."Customer No.", Rec."Cash payment amount", 'CASH', descriptionCash,
                    'G/L Account', '2910'));
            PostJournal(StrSubstNo(UrlPostGenJorunalLineLbl, CompanyId, cashId), '');
        end;

        if Rec."Card payment amount" > 0 then begin
            cardId := SendJournallLine(StrSubstNo(UrlGenJournalLbl, CompanyId),
                    LineContent(Rec."Customer No.", Rec."Card payment amount", 'CARD', descriptionBank,
                    'G/L Account', '2920'));
            PostJournal(StrSubstNo(UrlPostGenJorunalLineLbl, CompanyId, cardId), '');
        end;
    end;

    local procedure SendJournallLine(url: Text; content: Text): Text
    var
        WSGetCompanies: Codeunit WSGetCompanies;
        JsonObjectDocument: JsonObject;
        JsonToken: JsonToken;
    begin
        WSGetCompanies.PostMethod(url, content, JsonObjectDocument);
        JsonObjectDocument.Get('systemId', JsonToken);
        exit(JsonToken.AsValue().AsText());
    end;

    local procedure PostJournal(url: Text; content: Text): Text
    var
        WSGetCompanies: Codeunit WSGetCompanies;
        JsonObjectDocument: JsonObject;
    begin
        WSGetCompanies.PostMethodWihoutContent(url, content, JsonObjectDocument);
    end;

    procedure GetLineNo(): Integer
    var
        WSGetCompanies: Codeunit WSGetCompanies;
        JsonValueToken: JsonToken;
        JsonArrayLines: JsonArray;
        JsonTokenLine: JsonToken;
        JsonObjectLine: JsonObject;
        i: integer;
        LineNo: Integer;
    begin
        WSGetCompanies.ConnectToAPI('http://bc-195-default:7048/BC/api/marija/payment/v1.0/companies(8e669667-a8f6-ed11-8f72-6045bde9cc09)/paymentJournalLines?$filter=journalBatchName eq ''DEFAULT'' and journalTemplateName eq ''GENERAL''', JsonValueToken);
        JsonArrayLines := JsonValueToken.AsArray();
        for i := 0 to JsonArrayLines.Count() - 1 do begin
            JsonArrayLines.Get(i, JsonTokenLine);
            JsonObjectLine := JsonTokenLine.AsObject();
            LineNo := WSGetCompanies.GetFieldAsInteger(JsonObjectLine, 'lineNo');
        end;
        exit(LineNo);
    end;

    local procedure LineContent(CustomerNo: Code[20]; Amount: Decimal; PaymentMethodCode: Code[20];
                    Description: Text[200]; BalAccountType: Text[200]; BalAccountNo: Code[20]) Result: Text
    var
        JsonDocument: JsonObject;
    begin
        JsonDocument.Add('journalTemplateName', 'GENERAL');
        JsonDocument.Add('journalBatchId', '4077b702-e811-ee11-bcc9-ae920611320b');
        JsonDocument.Add('journalBatchName', 'DEFAULT');
        JsonDocument.Add('postingDate', Today());
        JsonDocument.Add('documentType', 'Payment');
        JsonDocument.Add('accountType', 'Customer');
        JsonDocument.Add('accountNo', CustomerNo);
        JsonDocument.Add('amount', -Amount);
        JsonDocument.Add('paymentMethodCode', PaymentMethodCode);
        JsonDocument.Add('description', Description);
        JsonDocument.Add('balAccountType', BalAccountType);
        JsonDocument.Add('balAccountNo', BalAccountNo);
        JsonDocument.Add('appliesToDocType', 'Invoice');
        JsonDocument.Add('documentNo', 'PAY - ' + SendSalesInvoice.GetInvNo());
        JsonDocument.Add('appliesToInvID', SendSalesInvoice.GetInvId());
        JsonDocument.Add('lineNo', GetLineNo() + 10000);
        JsonDocument.WriteTo(Result);
    end;

    var
        SendSalesInvoice: Codeunit SendSalesInvoice;

}