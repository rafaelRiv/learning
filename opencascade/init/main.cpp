#include <Standard_TypeDef.hxx>
#include <Draw_Main.hxx>
#include <Draw_Interpretor.hxx>


void Draw_InitAppli(Draw_Interpretor& drawInterpretor);

DRAW_MAIN;

void Draw_InitAppli(Draw_Interpretor& drawInterpretor)
{
    Draw::Commands(drawInterpretor);
}


