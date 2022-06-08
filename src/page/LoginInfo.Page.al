page 50316 "Login Info"
{
    Caption = 'Login Info';
    PageType = CardPart;
    Editable = false;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                ShowCaption = false;

                field("Name"; LoginManagement.GetCurrentLogin().Name)
                {
                    ShowCaption = false;
                    ToolTip = 'Specifies the value of the User Name field.';
                    ApplicationArea = All;
                    Style = StrongAccent;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Login)
            {
                ApplicationArea = All;
                Caption = 'Login';
                Promoted = true;
                PromotedOnly = true;
                Image = User;
                ToolTip = 'Executes the Login action.';

                trigger OnAction()
                var
                    TempLogin: Record Login temporary;
                    LoginMgt: Codeunit "Login Management";
                begin
                    TempLogin.Init();
                    TempLogin.Insert(true);
                    if Page.RunModal(Page::"Login User", TempLogin) = Action::LookupOk then
                        LoginMgt.SetCurrentUser(TempLogin."User Name");
                end;
            }
            action(LogOut)
            {
                ApplicationArea = All;
                Caption = 'Logout';
                Promoted = true;
                PromotedOnly = true;
                Image = Absence;
                ToolTip = 'Executes the LogOut action.';

                trigger OnAction()
                var
                    PasswordCodeunit: Codeunit "Login Management";
                begin
                    PasswordCodeunit.SetCurrentUser('');
                end;
            }
            action(RegisterNewUser)
            {
                ApplicationArea = All;
                Caption = 'Create Account';
                Promoted = true;
                PromotedOnly = true;
                Image = NewCustomer;
                ToolTip = 'Executes the Register New User action.';

                trigger OnAction()
                var
                    TempLogin: Record Login temporary;
                    Login: Record Login;
                    SendNewUser: Codeunit SendNewCustomer;
                    RegisterUser: Page "Register User";
                    Customer: Record Customer;
                begin
                    TempLogin.Init();
                    TempLogin.Insert();

                    if Page.RunModal(Page::"Register User", TempLogin) = Action::LookupOK then begin
                        Login.Init();
                        Login.TransferFields(TempLogin);
                        Login.Insert(true);

                        Customer.Init();
                        Customer.Name := TempLogin.Name;
                        Customer.Username := TempLogin."User Name";
                        Customer.Password := TempLogin.Password;
                        Customer."E-Mail" := TempLogin."E-Mail";
                        Customer.Insert(true);
                    end;

                    if not (TempLogin."User Name" = '') then begin
                        Customer.SetRange(Username, TempLogin."User Name");
                        if Customer.FindFirst() then
                            SendNewUser.Run(Customer);
                        Message('You have successfully created your account.');
                    end;

                end;
            }
        }
    }


    var
        LoginManagement: Codeunit "Login Management";
}