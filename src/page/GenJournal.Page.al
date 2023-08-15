page 50307 "Gen Journal"
{
    APIGroup = 'payment';
    APIPublisher = 'marija';
    APIVersion = 'v1.0';
    Caption = 'paymentJournal';
    DelayedInsert = true;
    EntityName = 'paymentJorunalLine';
    EntitySetName = 'paymentJournalLines';
    PageType = API;
    SourceTable = "Gen. Journal Line";
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {

                }
                field(documentNo; Rec."Document No.")
                { }

                field(lineNo; Rec."Line No.")
                { }
                field(journalTemplateName; Rec."Journal Template Name")
                {
                    Caption = 'Journal Template Name';
                }
                field(journalBatchId; Rec."Journal Batch Id")
                { }
                field("journalBatchName"; Rec."Journal Batch Name")
                { }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(accountType; Rec."Account Type")
                {
                    Caption = 'Account Type';
                }
                field(accountId; Rec."Account Id")
                {
                    Caption = 'Account Id';
                }
                field(accountNo; Rec."Account No.")
                {
                    Caption = 'Account No.';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(customerId; Rec."Customer Id")
                {
                    Caption = 'Customer Id';
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(balAccountType; Rec."Bal. Account Type")
                {
                    Caption = 'Bal. Account Type';
                }
                field(balAccountNo; Rec."Bal. Account No.")
                {
                    Caption = 'Bal. Account No.';
                }
                field(appliesToDocType; Rec."Applies-to Doc. Type")
                {
                    Caption = 'Applies-to Doc. Type';
                }
                field(appliesToDocNo; Rec."Applies-to Doc. No.")
                {
                    Caption = 'Applies-to Doc. No.';
                }

                field(appliesToInvID; Rec."Applies-to Invoice Id")
                {

                }
                field(genPostingType; Rec."Gen. Posting Type")
                {

                }
            }
        }
    }


    [ServiceEnabled]
    procedure PostJournalLine()
    begin
        Codeunit.Run(CODEUNIT::"Gen. Jnl.-Post", Rec);
    end;
}
