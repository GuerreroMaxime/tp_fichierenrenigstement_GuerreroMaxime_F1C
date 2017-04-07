Program Bataille;

Uses crt, SysUtils;

Const
	Nbbateau=2; 		//Nombre de bateau
	Maxcase=5;			//Taille max des bateaux
	MinL=1;				//Ligne minimun
	MaxL=50;			//Ligne maximum
	MinC=1;				//Colone minimun
	MaxC=50	;			//Colone maximun

Type
	Casse = Record				//Type pour enrengistrer les cases
			Ligne  :Integer;
			Col    :Integer;
	End;

Type 
	Bateau = Record			//Tableau de cases
		nCasse: Array[1..Maxcase] of Casse
    End;

Type
	Flotte = Record				//Tableau pour placer les bateaux
		nBateau: Array[1..Nbbateau] of Bateau
	End;

Type							//Pour les sens des poisitonnement des bateau
	PositionBateau= (enligne, encolone, endiago);

Type							//Pour l'etat des bateaux
	EtatBateau= (toucher, couler);

Type							//Pour savoir le joueur qui gagne a la fin
	EtatJoueur= (gagner, perdu);


Procedure Creatcase (l,c :Integer; var mcasse :Casse);

Begin							//Assigne les valeur pour la creation de case
	mcasse.ligne:=l;	
	mcasse.col:=c;
End;


Function Cmpcase (mCasse, tCasse :Casse): boolean;

Begin							//Permet de verifier les cases avec un boolean
	If (mCasse.col = tCasse.col) and (mCasse.ligne = tCasse.ligne) then
	Begin
	 Cmpcase:=True;
	End
	Else
	Begin
	 Cmpcase:=False;
	End;
End;


Function Creatbateau (mCasse: Casse; Taille :Integer): bateau;

var 							//Permet de créer un bateau et de remplir les cases vides
	Res 	  :Bateau;
	Posbateau :PositionBateau;
	Pos, i 	  :Integer;

Begin
	Randomize;
	Pos:=Random(3);
	Posbateau:=PositionBateau(pos);
	For i:=1 to Maxcase do
	 If (i<=Taille) then
	 Begin
	  Res.nCasse[i].ligne:=mCasse.ligne;
	  Res.nCasse[i].col:=mCasse.col;
	 End
	 Else
	 Begin
	  Res.nCasse[i].ligne:=0;
	  Res.nCasse[i].col:=0;
	 End;
	End;

	IF (PositionBateau=enligne) then
	Begin
	 mCasse.col:=mCasse.col+1;
	End.
	If (PositionBateau=encolone) then
	Begin
	 mCasse.ligne:=mCasse.ligne+1;
	End;
	If (PositionBateau=endiago) then
	Begin
	 mCasse.ligne=mCasse.ligne+1;
	 mCasse.Colone=mCasse.Colone+1;
	End;
  End;
 Creatbateau:=Res;
End;


Function Ctrlcase (nBat: Bateau; mCasse: Casse): boolean

Var 						//Permet de controler si une case est occuper
	i 		:Integer;
	valtest :boolean;

Begin
	valtest:=Faux;
	For i=1 to Maxcase pos1 do
	Begin
	 If (compCase(nBat.nCasse[i], mCasse)) then
	 Begin
	  valtest:=True;
	 End;
	End;
	Ctrlcase:=valtest;
End;


Function Ctrlflotte (nFlotte:Flotte; nCasse:Casse): boolean;

Var
	i: Integer;
	valtest: boolean;

Begin					//Permer de voir les bateau qui reste
	 valtest:=Faux;
	 For i=1 to Nbbateau pos=1 do
	  IF (Ctrlcase(nFlotte.nBateau[i], nCasse)) then
	  Begin
	   valtest:=True;
	  End;
	 End;
	End;
	Ctrlflotte:=valtest;
End;



Var
Protest, coltest, lignetest	:Integer;

Begin
clrscr;
Creatcase(Protest);
Cmpcase(Protest);
Writeln('Creation de bateau');
Creatbateau(Protest);
Writeln('Debut de la partie');

Repeat
	Writeln('Tour du joueur');

	Writeln('Selectionner une case en ligne')
	Readln(lignetest);
	If (lignetest<MinL) and (lignetest>MaxL)
	 Repeat
	  Writeln('Valeur incorect');
	  Readln(lignetest);
	Until (lignetest>MinL) and (lignetest<MaxL)

	Writeln('Selectionner une case en ligne')
	Readln(coltest);
	If (lignetest<MinC) and (lignetest>MaxC)
	 Repeat
	  Writeln('Valeur incorect');
	  Readln(coltest);
	Until (lignetest>MinC) and (lignetest<MaxC)

	Ctrlcase(Protest)
	If Ctrlcase=False then
	Begin 
		Writeln('Vous avez toucher personne');
	End;
	If Ctrlcase=True then
	Begin
		Writeln('Vous avez toucher un bateau');
	End;

Until Ctrlflotte=False


End;