codeunit 50308 "Login Management"
{
    SingleInstance = true;

    trigger OnRun()
    begin
        StorePassword('admin', 'Pa$$word');
        if HasUser('admin') then
            Message('%1', GetPassword('admin'))
        else
            Message('admin user does not exists');
    end;

    local procedure HasUser(User: Text): Boolean
    begin
        exit(IsolatedStorage.Contains(User));
    end;

    procedure StorePassword(User: Text; Pwd: Text): Boolean
    begin
        if EncryptionEnabled() then
            exit(IsolatedStorage.SetEncrypted(User, Pwd))
        else
            exit(IsolatedStorage.Set(User, Pwd));
    end;

    local procedure GetPassword(User: Text) Pwd: Text
    begin
        IsolatedStorage.Get(User, Pwd);
        exit(Pwd);
    end;

    procedure CheckPassword(User: Text; Pwd: Text): Boolean
    var
        Login: Record Login;
    begin
        Login.SetRange("User Name", User);
        if Login.IsEmpty() then
            Error('User %1 is not registered yet.', User);

        exit(GetPassword(User) = Pwd);
    end;

    procedure GetCurrentUser(): Text[250];
    begin
        exit(CurrentUser);
    end;

    procedure GetCurrentLogin() Login: Record Login;
    begin
        Login.SetRange("User Name", CurrentUser);
        if not Login.FindFirst() then
            Clear(Login);
    end;

    procedure SetCurrentUser(NewUser: Text[250]);
    begin
        CurrentUser := NewUser;
    end;

    var
        CurrentUser: Text[250];

}