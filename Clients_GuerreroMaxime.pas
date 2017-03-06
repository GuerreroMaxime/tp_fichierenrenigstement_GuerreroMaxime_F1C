Program Clients;

Uses crt;

Const 
	max=1;

Type Client=record
	 Nom 		  :string;
	 Prenom 	  :string;
	 Adresse	  :string;
	 Codepostal   :integer;
	 Ville		  :string;
end;

Type
	tableau=Array[1..max] of Client;

Procedure Saisir(info :integer);

Var
	i	:integer;
	tableauetud	:tableau;

Begin
	clrscr;
	For i:=1 to max do
		Begin
		Writeln('Entrer les information du Client ', i);
		Writeln('Votre nom');
		Readln(tableauetud[i].Nom);
		Writeln('Votre prenom');
		Readln(tableauetud[i].Prenom);
		Writeln('Votre adresse');
		Readln(tableauetud[i].Adresse);
		Writeln('Votre code postal');
		Readln(tableauetud[i].Codepostal);
		Writeln('Votre Ville');
		Readln(tableauetud[i].Ville);
		End;
End;

Procedure Affiche(info :integer);

Var
	i :integer;
	tableauetud	:tableau;

Begin
	clrscr;
	For i:=1 to max do
	Begin
		Writeln('Les informations personelles de la personne ', i);
		Writeln(tableauetud[i].Nom);
		Writeln(tableauetud[i].Prenom);
		Writeln(tableauetud[i].Adresse);
		Writeln(tableauetud[i].Codepostal);
		Writeln(tableauetud[i].Ville);
		Readln;
	End;
End;

var
    f:TextFile;//ou Text (Descripteur du fichier)
    nom:string;
    choix:integer;
    s: String ;
    info: integer;


BEGIN
	Repeat
    clrscr;
    writeln('Programme Fichier Client');
    Assign(f,'init.txt');
    writeln('1-Nouveau Client');
    Writeln('2-Voir Client');
    Writeln('3-Quitter le Programme');
    readln(choix);
 	
 	If choix=1 then
 	Begin
 		Append(f);
 		Saisir(info);
 		close(f);
 	End;

 	If choix=2 then
 	begin
 		Reset(f);
 		Affiche(info);
 		close(f);
 	end;

 	Until choix=3;
END.

