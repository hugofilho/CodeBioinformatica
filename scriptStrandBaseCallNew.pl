#!/usr/bin/perl

use strict;

use warnings;
 
use Text::CSV_XS;

#module Switch
use Switch;

use Class::Fields;

#@utor: Hugo Leite
#Versao: 11
#Data: 11/10/2019
#incluindo as familias: CMA027, CMA039, CMA040, CMA045, CMA051, CMA052,
#                                 CMA053, CMA060, CMA065, CMA066, CMA068, CMA070, CMA072, CMA067

my $filename = 'F:\doutorado\dados\CMA065 Genotype Call.txt';

my $file = $filename or die "Need to get CSV file on the command line\n";

my $csv = Text::CSV_XS->new({
    sep_char => qq|\t|
});
 
 my @fields;
 
 my $probe_set_id = '';
 my $call_code_offspring = '';
 my $tx_confidence_offspring = '';
 my $vl_signal_A_offspring = '';
 my $vl_signal_B_offspring = '';
 my $call_base_offspring = '';
 my $call_code_mother = '';
 my $tx_confidence_mother = '';
 my $vl_signal_A_mother = '';
 my $vl_signal_B_mother = '';
 my $call_base_mother = '';
 my $call_code_father = '';
 my $tx_confidence_father = '';
 my $vl_signal_A_father = '';
 my $vl_signal_B_father = '';
 my $call_base_father = '';
 my $dbSNP = '';
  my $chromosome_id = '';
 my $position = '';

     
open(my $data, '<:encoding(utf8)', $file) or die "Could not open '$file' $!\n";
     
open(my $fh_log, '>>', 'F:\doutorado\dados\resultadosBaseCall\BaseCallCMA065-1F.csv');
 
while (my $fields = $csv->getline( $data )) {
  
  chomp $fields ;
  $fields =~ s/\s*#.*$//;
  
  # Para a familia F09A.txt temos as seguintes posicoes de cabecalho: Possui 3 Filhos  
  #$probe_set_id             = $fields->[0];        
  #$call_code_mother         = $fields->[1];S
  #$tx_confidence_mother     = $fields->[2];
  #$vl_signal_A_mother       = $fields->3];
  #$vl_signal_B_mother       = $fields->[4];
  #$call_base_mother         = $fields->[5];  
  #$call_code_offspring      = $fields->[6];
  #$tx_confidence_offspring  = $fields->[7];
  #$vl_signal_A_offspring    = $fields->[8];
  #$vl_signal_B_offspring    = $fields->[9];
  #$call_base_offspring      = $fields->[10];
  #$call_code_father         = $fields->[11];
  #$tx_confidence_father     = $fields->[12];
  #$vl_signal_A_father       = $fields->[13];
  #$vl_signal_B_father       = $fields->[14];
  #$call_base_father         = $fields->[15];  
  #$dbSNP                    = $fields->[16];
  #$chromosome_id            = $fields->[17];
  #$position                 = $fields->[18];
  
  #Para a familia F09A.txt temos as seguintes posicoes de cabecalho: Possui 2 Filhos  
  #$probe_set_id             = $fields->[0];        
  #$call_code_mother         = $fields->[1];
  #$tx_confidence_mother     = $fields->[2];
  #$vl_signal_A_mother       = $fields->[3];
  #$vl_signal_B_mother       = $fields->[4];
  #$call_base_mother         = $fields->[5];  
  #$call_code_offspring      = $fields->[6];
  #$tx_confidence_offspring  = $fields->[7];
  #$vl_signal_A_offspring    = $fields->[8];
  #$vl_signal_B_offspring    = $fields->[9];
  #$call_base_offspring      = $fields->[10];
  #$call_code_father         = $fields->[11];
  #$tx_confidence_father     = $fields->[12];
  #$vl_signal_A_father       = $fields->[13];
  #$vl_signal_B_father       = $fields->[14];
  #$call_base_father         = $fields->[15];  
  #$dbSNP                    = $fields->[16];
  #$chromosome_id            = $fields->[17];
  #$position                 = $fields->[18];
  
  #Para a familia controle CMA001.txt temos as seguintes posicoes de cabecalho
  $probe_set_id             = $fields->[0];  
  $call_code_offspring      = $fields->[1];
  $tx_confidence_offspring  = $fields->[2];
  $vl_signal_A_offspring    = $fields->[3];
  $vl_signal_B_offspring    = $fields->[4];
  $call_base_offspring      = $fields->[5];    
  $call_code_mother         = $fields->[6];
  $tx_confidence_mother     = $fields->[7];
  $vl_signal_A_mother       = $fields->[8];
  $vl_signal_B_mother       = $fields->[9];
  $call_base_mother         = $fields->[10];  
  $call_code_father         = $fields->[11];
  $tx_confidence_father     = $fields->[12];
  $vl_signal_A_father       = $fields->[13];
  $vl_signal_B_father       = $fields->[14];
  $call_base_father         = $fields->[15];
  $dbSNP                    = $fields->[16];
  $chromosome_id            = $fields->[17];
  $position                 = $fields->[18];
  
  #Para a familia controle F06-2F.txt temos as seguintes posicoes de cabecalho
  #$probe_set_id             = $fields->[0];  
  #$call_code_father         = $fields->[1];
  #$tx_confidence_father     = $fields->[2];
  #$vl_signal_A_father       = $fields->[3];
  #$vl_signal_B_father       = $fields->[4];
  #$call_base_father         = $fields->[5];
  #$call_code_offspring      = $fields->[6];
  #$tx_confidence_offspring  = $fields->[7];
  #$vl_signal_A_offspring    = $fields->[8];
  #$vl_signal_B_offspring    = $fields->[9];
  #$call_base_offspring      = $fields->[10]; 
  #$call_code_mother         = $fields->[11];
  #$tx_confidence_mother     = $fields->[12];
  #$vl_signal_A_mother       = $fields->[13];
  #$vl_signal_B_mother       = $fields->[14];
  #$call_base_mother         = $fields->[15];         
  #$dbSNP                    = $fields->[16];
  #$chromosome_id            = $fields->[17];
  #$position                 = $fields->[18];  
  
#Para a familia F09-2F.txt [6-10] temos as seguintes posicoes de cabecalho: Possui 2 Filhos  
#Para a familia F09-3F.txt [11-15] temos as seguintes posicoes de cabecalho: Possui 2 Filhos 

  # $probe_set_id             = $fields->[0];
  # $call_code_mother         = $fields->[1];
  # $tx_confidence_mother     = $fields->[2];
  # $vl_signal_A_mother       = $fields->[3];
  # $vl_signal_B_mother       = $fields->[4];
  # $call_base_mother         = $fields->[5];
  # $call_code_offspring      = $fields->[6];
  # $tx_confidence_offspring  = $fields->[7];
  # $vl_signal_A_offspring    = $fields->[8];
  # $vl_signal_B_offspring    = $fields->[9];
  # $call_base_offspring      = $fields->[10]; 
  # $call_code_father         = $fields->[26];
  # $tx_confidence_father     = $fields->[27];
  # $vl_signal_A_father       = $fields->[28];
  # $vl_signal_B_father       = $fields->[29];
  # $call_base_father         = $fields->[30];
  # $dbSNP                    = $fields->[31];  
  # $chromosome_id            = $fields->[32];
  # $position                 = $fields->[33];
  
  #Para a familia F07-4F.txt [11-15] temos as seguintes posicoes de cabecalho: Possui 2 Filhos 
  #$probe_set_id                = $fields->[0];
  #$call_code_mother         = $fields->[1];
  #$tx_confidence_mother   = $fields->[2];
  #$vl_signal_A_mother       = $fields->[3];
  #$vl_signal_B_mother       = $fields->[4];
  #$call_base_mother          = $fields->[5];
  #$call_code_father         = $fields->[6];
  #$tx_confidence_father     = $fields->[7];
  #$vl_signal_A_father       = $fields->[8];
  #$vl_signal_B_father       = $fields->[9];
  #$call_base_father         = $fields->[10];
  #$call_code_offspring        = $fields->[11];
  #$tx_confidence_offspring  = $fields->[12];
  #$vl_signal_A_offspring      = $fields->[13];
  #$vl_signal_B_offspring     = $fields->[14];
  #$call_base_offspring      = $fields->[15]; 
  #$dbSNP                    = $fields->[16];  
  #$chromosome_id            = $fields->[17];
  #$position                 = $fields->[18];
  
  @fields = ($probe_set_id,$call_code_father,$tx_confidence_father,
                   $vl_signal_A_father,$vl_signal_B_father,$call_base_father,
                   $call_code_mother,$tx_confidence_mother,
                   $vl_signal_A_mother,$vl_signal_B_mother,$call_base_mother,
                   $call_code_offspring,$tx_confidence_offspring,
                   $vl_signal_A_offspring,$vl_signal_B_offspring,$call_base_offspring,                                      
                   $dbSNP,$chromosome_id,$position
               );
  
  
   my $strMutacao5 = ",Mutacao Base Nitrogenada - Origem Materna ou Paterna";
   my $strMutacao6 = ",Mutacao Base Nitrogenada - Origem Materna e Paterna";
   my $strMutacao7 = ",Mutacao Base Nitrogenada - Origem Materna";
   my $strMutacao8 = ",Mutacao Base Nitrogenada - Origem Paterna";
   my $strMutacao9 = ",Transicao - Purina/Purina";
   my $strMutacao10 = ",Transversao - Purina/Pirimidina";
   my $strMutacao11 = ",Nao Houve Mutacao na Base";
   my $strMutacao12 = ",Nao Houve Mutacao na Substituicao da Base";
   my $strMutacao13 = ",Sem Evidencia";
   my $strMutacao14 = ",Inconclusivo";
   my $strMutacao15 = ",Transicao - Pirimidina/Pirimidina";
   
   my $reg = '';
   $reg = join(',',@fields);
  
     switch ($call_base_mother) {
          case 'AA' {if ($call_base_father eq 'AA') {          
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }                             
                         }
                         elsif($call_base_offspring eq 'CA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'AG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9;
                            } 
                         }
                         elsif($call_base_offspring eq 'GA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9;
                            } 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'CC') {                            
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'CG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'GC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9;
                            }
                         }
                         elsif($call_base_offspring eq 'TG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }                      
                     } #if $call_base_father 'AA'
                     
                     elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9;
                            } 
                         }
                         elsif($call_base_offspring eq 'GA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9;
                            } 
                         }
                         elsif($call_base_offspring eq 'AT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'TA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'CC') {
                            say $fh_log $reg, $strMutacao7, $strMutacao9;
                         }
                         elsif($call_base_offspring eq 'CG') {
                            say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                            say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                            say $fh_log $reg, $strMutacao7, $strMutacao10;	 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                            say $fh_log $reg, $strMutacao7, $strMutacao10;	
                         }
                         elsif($call_base_offspring eq 'GG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'TG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao9, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao9, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao9, $strMutacao15;
                            } 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                            } 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'AC' or 'CA')
                     elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'CA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'TA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }	
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }	 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }	 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                            say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'AG' or 'GA')
                     elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'CA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'AG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'GA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'CG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }	 
                         }
                         elsif($call_base_offspring eq 'GC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }	 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }	 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'AT' or 'TA')
                     elsif ($call_base_father eq 'CC') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'TG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'CC')
                     elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                     elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                     elsif ($call_base_father eq 'GG') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }  
                         }    
                         elsif($call_base_offspring eq 'TC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'GG')   
                     elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                            say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                            say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                     elsif ($call_base_father eq 'TT') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'CG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                            }
                         }
                         elsif($call_base_offspring eq 'GC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                            } 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }                         
                     }#elsif ($call_base_father eq 'TT')     
                     elsif ($call_base_father eq '') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq '')
                 }  # fim do case AA;
                 
                case ['AC','CA'] {if ($call_base_father eq 'AA') {          
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'GA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq 'AT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'TA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            }  
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8,  $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq 'TG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            }  
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }  
                         }    
                         elsif($call_base_offspring eq 'TT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }    
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }                   
                     } #if $call_base_father 'AA'
                     
                     elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'GA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq 'AT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            }
                         }
                         elsif($call_base_offspring eq 'TA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            }
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'GG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq 'TG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }  
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }  
                         }    
                         elsif($call_base_offspring eq 'TT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'AC' or 'CA')
                     elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'TA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'AG' or 'GA')
                     elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'GA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'AT' or 'TA')
                     elsif ($call_base_father eq 'CC') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'TG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
                            } 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
                            } 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
                            } 
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'CC')
                     elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
                            } 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
                            }; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
                            }
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
                            } 
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                     elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao15;
                            }  
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         } 
                     }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                     elsif ($call_base_father eq 'GG') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao15;
                            }  
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'GG')   
                     elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                     elsif ($call_base_father eq 'TT') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao15;
                            }  
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'TT')   
                     elsif ($call_base_father eq '') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq '')  
                 }  # fim do case AC, CA;
                 
            case ['AG','GA'] {if ($call_base_father eq 'AA') {          
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq 'CA') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq 'TA') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq 'CC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }  
                         }  
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }                     
                     } #if $call_base_father 'AA'
                     
                     elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;  
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            }  
                         }
                         elsif($call_base_offspring eq 'TA') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            }  
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10;  
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            }  
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'AC' or 'CA')
                     elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq 'TA') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq 'CC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq 'CG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq 'GC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }  
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }  
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            }  
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'AG' or 'GA')
                     
                     elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao15; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'AT' or 'TA')
                     elsif ($call_base_father eq 'CC') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            }
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'CC')
                     
                     elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao15;
                            } 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao15;
                            } 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                              if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                            } 
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                     elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                     elsif ($call_base_father eq 'GG') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }
                         }
                         elsif($call_base_offspring eq 'CG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }
                         }
                         elsif($call_base_offspring eq 'GC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'GG')   
                     elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }
                         }
                         elsif($call_base_offspring eq 'CG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                     elsif ($call_base_father eq 'TT') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'TT')  
                     elsif ($call_base_father eq '') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq '')   
                 }  # fim do case AG, GA;
                 
                 case ['AT','TA'] {if ($call_base_father eq 'AA') {          
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'CA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                            }
                         }
                         elsif($call_base_offspring eq 'AG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'GA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'CG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'GC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao15;
                            } 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8,  $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'TG') {
                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }                    
                     } #if $call_base_father 'AA'
                     
                     elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;  
                         }
                         elsif($call_base_offspring eq 'AG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'GA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;  
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'AC' or 'CA')
                     elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'CA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'AG' or 'GA')
                     
                     elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            }
                         }
                         elsif($call_base_offspring eq 'CA') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'GA') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                            }
                         }
                         elsif($call_base_offspring eq 'GC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                            } 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'TG') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9;
                            } 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9;
                            } 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'AT' or 'TA')
                     elsif ($call_base_father eq 'CC') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'CC')
                     
                     elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                     elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                     elsif ($call_base_father eq 'GG') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            }
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'GG')   
                     elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao15;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            }
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            }
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            }
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         } 
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                     elsif ($call_base_father eq 'TT') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao15; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                            } 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                            if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                            } 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             if ($tx_confidence_father >  $tx_confidence_mother) {               
                                say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                            }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                            } 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq 'TT')  
                     elsif ($call_base_father eq '') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                         elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                             say $fh_log $reg, $strMutacao13, $strMutacao14; 
                         }
                     }#elsif ($call_base_father eq '')   
                 }  # fim do case AT, TA;
                 
                 case 'CC' {if ($call_base_father eq 'AA') {          
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao9;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                                    } 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                                    }
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                    }
                                 }            
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                    say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }           
                             } #if $call_base_father 'AA'
                     
                             elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                    } 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
                                    } 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                    }
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                    } 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                    } 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                    }
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                    say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'AC' or 'CA')
                             elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                    } 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                    say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'AG' or 'GA')
                             elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao15;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                    say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'AT' or 'TA')
                             elsif ($call_base_father eq 'CC') {
                                 if ($call_base_offspring eq 'AA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    }
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    }
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao15;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao15;
                                    } 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao15;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao15;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    }; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                    } 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                    } 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao15;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao15;
                                    } 
                                 } 
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                    say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'CC')
                             elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                    }
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                                    }
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                    } 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                    } 
                                 } 
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                    say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                             elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    }
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    }
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    }
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    }
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao15;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao15;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                    } 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 } 
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                    say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                             elsif ($call_base_father eq 'GG') {
                                 if ($call_base_offspring eq 'AA') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                    }
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao15; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                    } 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                    say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'GG')   
                             elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                    }
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao15;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                    }
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 } 
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                    say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                             elsif ($call_base_father eq 'TT') {
                                 if ($call_base_offspring eq 'AA') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    }
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    }
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                    say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'TT')  
                             elsif ($call_base_father eq '') {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq '')   
                 }  # fim do case CC;
                 
                 case ['CG','GC'] {if ($call_base_father eq 'AA') {          
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao8,  $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                                        }  
                                     }   
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }                    
                                 } #if $call_base_father 'AA'
                                 
                                 elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;  
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;  
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao15;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                        } 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao15;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15;
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15;
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                        } 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'AC' or 'CA')
                                 elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                                        } 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                                        } 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                        } 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'AG' or 'GA')
                                 
                                 elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'AT' or 'TA')
                                 elsif ($call_base_father eq 'CC') {
                                     if ($call_base_offspring eq 'AA') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        }
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        }  
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12;  
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        } 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao15; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao15;
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                        }
                                     } 
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'CC')
                                 
                                 elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        }
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                        } 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                        } 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                        } 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                        }
                                     } 
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                                 elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                                     if ($call_base_offspring eq 'AA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        }
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10;
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     } 
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                                 elsif ($call_base_father eq 'GG') {
                                     if ($call_base_offspring eq 'AA') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        }
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        }  
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                                        }
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
                                        }
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao15;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao15;
                                        } 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao15;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao15;
                                        } 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                        } 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'GG')   
                                 elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        }
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        }
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg,$strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10 
                                     } 
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                                 elsif ($call_base_father eq 'TT') {
                                     if ($call_base_offspring eq 'AA') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        }
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'TT')     
                                 elsif ($call_base_father eq '') {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq '')
                 }  # fim do case CG, GC;
                 
                 case ['CT','TC'] {if ($call_base_father eq 'AA') {          
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao8,  $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }  
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }                     
                                 } #if $call_base_father 'AA'
                                 
                                 elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;  
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;  
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'AC' or 'CA')
                                 elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'AG' or 'GA')
                                 
                                 elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        }
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        }
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        } 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        } 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'AT' or 'TA')
                                 elsif ($call_base_father eq 'CC') {
                                     if ($call_base_offspring eq 'AA') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        }
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5,$strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7,$strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao15; 
                                     } 
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'CC')
                                 
                                 elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                                     if ($call_base_offspring eq 'AA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7,$strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        }
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        }
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                     } 
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                                 elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                                     if ($call_base_offspring eq 'AA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        }
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        }
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        }
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        }
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        }
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        }
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     } 
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                                 elsif ($call_base_father eq 'GG') {
                                     if ($call_base_offspring eq 'AA') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        }
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'GG')   
                                 elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
                                        }
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     } 
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                                 elsif ($call_base_father eq 'TT') {
                                     if ($call_base_offspring eq 'AA') {
                                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5,  $strMutacao10;
                                        }
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        }
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        }
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
                                            say $fh_log $reg, $strMutacao7, $strMutacao10;
                                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao8, $strMutacao10;
                                        }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                            say $fh_log $reg, $strMutacao5, $strMutacao10;
                                        } 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'TT')
                                  elsif ($call_base_father eq '') {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq '')     
                 }  # fim do case CT, TC;      
                 
                 case 'GG' {if ($call_base_father eq 'AA') {          
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    }
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    } 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10;
                                    } 
                                 }    
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }                   
                             } #if $call_base_father 'AA'
                     
                             elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;
                                    }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao8, $strMutacao15;
                                    }elsif ($tx_confidence_father ==  $tx_confidence_mother) {
                                        say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
                                    } 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'AC' or 'CA')
                             elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									}  
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									}  
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									} 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									} 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									}  
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'AG' or 'GA')
                             elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									} 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'AT' or 'TA')
                             elsif ($call_base_father eq 'CC') {
                                 if ($call_base_offspring eq 'AA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									}
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									} 
                                 } 
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'CC')
                             elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                                 if ($call_base_offspring eq 'AA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									}
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
									} 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
									} 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									} 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									} 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
									} 
                                 } 
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                             elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                                 if ($call_base_offspring eq 'AA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									}
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 } 
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                             elsif ($call_base_father eq 'GG') {
                                 if ($call_base_offspring eq 'AA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9;
									} 
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									}
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9;
									}
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9;
									}
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									}
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									}
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									} 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									}
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'GG')   
                             elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                                 if ($call_base_offspring eq 'AA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									}
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									}
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
									} 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									}
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 } 
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                             elsif ($call_base_father eq 'TT') {
                                 if ($call_base_offspring eq 'AA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									}
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
									} 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
									} 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									} 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                    say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'TT')    
                              elsif ($call_base_father eq '') {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq '') 
                 }  # fim do case GG;         
                 
                 case ['GT','TG'] {if ($call_base_father eq 'AA') {          
                                     if ($call_base_offspring eq 'AA') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;  
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                        say $fh_log $reg, $strMutacao8,  $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }      
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }                 
                                 } #if $call_base_father 'AA'
                                 
                                 elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15;  
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15;  
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'AC' or 'CA')
                                 elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao10;  
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
										}  
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
										}  
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'AG' or 'GA')
                                 
                                 elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15;  
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
										}  
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao10;
										} 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao10;
										} 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'AT' or 'TA')
                                 elsif ($call_base_father eq 'CC') {
                                     if ($call_base_offspring eq 'AA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
										}
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao15; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao15; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                        say $fh_log $reg, $strMutacao6, $strMutacao15; 
                                     } 
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                        say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'CC')
                                 
                                 elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                                     if ($call_base_offspring eq 'AA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
										}
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
										} 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
										} 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     } 
                                 }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                                 elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                                     if ($call_base_offspring eq 'AA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
										}
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                        say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     } 
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                                 elsif ($call_base_father eq 'GG') {
                                     if ($call_base_offspring eq 'AA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
										}
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
										}
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
										} 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
										} 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
										} 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
										}
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'GG')   
                                 elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                                     if ($call_base_offspring eq 'AA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
										}
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
										}
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
										} 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
										}  
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
										}  
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
										}
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                       if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     } 
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                                 elsif ($call_base_father eq 'TT') {
                                     if ($call_base_offspring eq 'AA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
										}
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
										}
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao15;
										}
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao10;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao15; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao15;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
										} 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                        if ($tx_confidence_father >  $tx_confidence_mother) {               
											say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
										}elsif ($tx_confidence_father <  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao8, $strMutacao15;
										}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
											say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
										} 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                        say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                        say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq 'TT')    
                                  elsif ($call_base_father eq '') {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq '') 
                 }  # fim do case GT, TG;
                 
                 case 'TT' {if ($call_base_father eq 'AA') {          
                                 if ($call_base_offspring eq 'AA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									} 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									}  
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
									}  
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                    say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }                       
                             } #if $call_base_father 'AA'
                     
                             elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									}  
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'AC' or 'CA')
                             elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     ay $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									}  
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'AG' or 'GA')
                             elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									}  
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
									}  
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
									}  
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									}  
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									} 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									}  
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									} 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									} 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'AT' or 'TA')
                             elsif ($call_base_father eq 'CC') {
                                 if ($call_base_offspring eq 'AA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									} 
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									}  
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									}   
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10;  
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 } 
                             }#elsif ($call_base_father eq 'CC')
                             elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                                 if ($call_base_offspring eq 'AA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 } 
                             }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                             elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                                 if ($call_base_offspring eq 'AA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									} 
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									}  
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									}  
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									} 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									}  
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10;
									}  
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 } 
                             }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                             elsif ($call_base_father eq 'GG') {
                                 if ($call_base_offspring eq 'AA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
									}  
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10, $strMutacao15;
									} 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9;
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									}  
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                    say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                    say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'GG')   
                             elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                                 if ($call_base_offspring eq 'AA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									} 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									} 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									}  
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									}  
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									}  
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao15; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									}   
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao15;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao10, $strMutacao15;
									} 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                    say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                    say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 } 
                             }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                             elsif ($call_base_father eq 'TT') {
                                 if ($call_base_offspring eq 'AA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
									}  
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
									} 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
									} 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
									}
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
									} 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
									} 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
									} 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
									} 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
									} 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao9, $strMutacao10;
									} 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
									}
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                    if ($tx_confidence_father >  $tx_confidence_mother) {               
										say $fh_log $reg, $strMutacao7, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father <  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao8, $strMutacao15, $strMutacao9;
									}elsif ($tx_confidence_father ==  $tx_confidence_mother) {
										say $fh_log $reg, $strMutacao5, $strMutacao15, $strMutacao9;
									}
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                     say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                 }
                             }#elsif ($call_base_father eq 'TT') 
                              elsif ($call_base_father eq '') {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                     elsif($call_base_offspring eq '' or $call_base_offspring eq 'NoCall') {
                                         say $fh_log $reg, $strMutacao13, $strMutacao14; 
                                     }
                                 }#elsif ($call_base_father eq '')    
                 }  # fim do case TT;
                 case '' {say $fh_log $reg, $strMutacao13, $strMutacao14;} # fim do case ''                         
        }  # fim do switch         
   }  # fim do while
	