program kantu;

{$DEFINE DELPHI}


uses
  Forms,
  kantu_main in 'kantu_main.pas' {MainForm},
  kantu_loadsymbol in 'kantu_loadsymbol.pas' {loadSymbol},
  kantu_pricepattern in 'kantu_pricepattern.pas' {PricePatternForm},
  kantu_filters in 'kantu_filters.pas' {FiltersForm},
  kantu_custom_filter in 'kantu_custom_filter.pas' {CustomFilterForm},
  kantu_portfolioresults in 'kantu_portfolioresults.pas' {PortfolioResultForm},
  kantu_simulation in 'kantu_simulation.pas' {SimulationForm},
  kantu_simulation_show in 'kantu_simulation_show.pas' {SimulationForm2},
  kantu_singlesystem in 'kantu_singlesystem.pas' {SingleSystem},
  kantu_init in 'kantu_init.pas',
  kantu_definitions in 'kantu_definitions.pas',
  kantu_indicators in 'kantu_indicators.pas',
  kantu_multithreading in 'kantu_multithreading.pas';

{$R *.res}



begin


  Application.Initialize;

  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSimulationForm, SimulationForm);
  Application.CreateForm(TPricePatternForm, PricePatternForm);
  Application.CreateForm(TFiltersForm, FiltersForm);
  Application.CreateForm(TCustomFilterForm, CustomFilterForm);
  Application.CreateForm(TloadSymbol, loadSymbol);
  Application.CreateForm(TPortfolioResultForm, PortfolioResultForm);
  Application.CreateForm(TSimulationForm2, SimulationForm2);
  Application.CreateForm(TSingleSystem, SingleSystem);
  init;
  Application.Run;

end.
