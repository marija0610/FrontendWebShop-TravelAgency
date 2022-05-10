page 50301 "TouristActivity"
{
    Caption = 'TouristActivity';
    PageType = CardPart;
    SourceTable = TouristActivity;

    layout
    {
        area(content)
        {
            group(General)
            {
                cuegroup(Group)
                {
                    Caption = 'Tourist';
                    field(Field1; MyCueValue())
                    {
                        ApplicationArea = All;
                        Caption = 'My Field 1';
                        ToolTip = 'My Field 1';
                        Image = Camera;
                        Style = Favorable;

                        trigger OnDrillDown()
                        begin
                            Message('Cao');
                        end;
                    }

                    field(Field2; Rec."No. of Customers")
                    {
                        ApplicationArea = All;
                        Caption = 'My Field 2';
                        ToolTip = 'My Field 2';
                        Image = Camera;
                        Style = AttentionAccent;
                    }

                    field(Field3; MyCueValue())
                    {
                        ApplicationArea = All;
                        Caption = 'My Field 2';
                        ToolTip = 'My Field 2';
                        Image = Camera;
                        Style = AttentionAccent;
                    }
                }

                cuegroup(Group2)
                {
                    actions
                    {
                        action(ActionName)
                        {
                            //RunObject = page "Sales Invoice";
                            Caption = 'Create Sales Invoice';
                            Image = TileBrickNew;
                            ToolTip = 'this action will create new sales invoice and then hopefully also post it.';
                            RunObject = Codeunit CreateSalesInvoice;

                        }

                        action(ActionYellow)
                        {
                            Image = TileYellow;

                            trigger OnAction()
                            begin
                                Message('Goodbye');
                            end;
                        }
                    }
                }
            }
        }

    }

    trigger OnOpenPage()
    begin
        if not FindFirst() then begin
            Rec.Init();
            Rec.Insert(true);
        end;
    end;

    local procedure MyCueValue(): Integer
    var
        myInt: Integer;
    begin
        exit(2)
    end;
}
