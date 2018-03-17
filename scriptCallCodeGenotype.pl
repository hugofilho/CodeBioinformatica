#!/usr/bin/perl
use strict;

use warnings;
 
use Text::CSV_XS;

#module Switch
use Switch;

use Class::Fields;

#@utor: Hugo Leite
#Versao: 3.3
#Data: 21/07/2017
#Colocando dentro do GitHub

 my $filename = 'F:\doutorado\dados\resultadosBaseCall\BaseCallF08.txt';
#my $filename = 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\output.strand.base.call.CMA025.txt';
 
my $file = $filename or die "Need to get CSV file on the command line\n";

#my $csv = Text::CSV_XS->new({
#    sep_char => qq|\t|
#});
 
 my $csv = Text::CSV_XS->new ({ sep_char => "," });
         $csv->sep_char (",");
 # my $c = $csv->sep_char;
 
 my @fields;
 
 my $probe_set_id = '';
 my $call_code_mother = '';
 my $tx_confidence_mother = '';
 my $vl_signal_A_mother = '';
 my $vl_signal_B_mother = '';
 my $call_base_mother = '';
 my $call_code_offspring = '';
 my $tx_confidence_offspring = '';
 my $vl_signal_A_offspring = '';
 my $vl_signal_B_offspring = '';
 my $call_base_offspring = '';
 my $call_code_father = '';
 my $tx_confidence_father = '';
 my $vl_signal_A_father = '';
 my $vl_signal_B_father = '';
 my $call_base_father = '';
 my $dbSNP = '';
 my $position = '';
 my $chromosome_id = '';
 my $origem_mutacao = '';
 my $tipo_mutacao = '';
     
open(my $data, '<:encoding(utf8)', $file) or die "Could not open '$file' $!\n";
     
 open(my $fh_log, '>>', 'F:\doutorado\dados\resultadoCodeGenotype\resultadoGenotypeCallF08.txt');
#open(my $fh_log, '>>', 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\output.genotype.code.base.CMA025.txt');

 
while (my $fields = $csv->getline( $data )) {
  
  chomp $fields ;
  $fields =~ s/\s*#.*$//;
  
  
  $probe_set_id             = $fields->[0];
  $call_code_father         = $fields->[1];
  $tx_confidence_father     = $fields->[2];
  $vl_signal_A_father       = $fields->[3];
  $vl_signal_B_father       = $fields->[4];
  $call_base_father         = $fields->[5];
  $call_code_mother         = $fields->[6];
  $tx_confidence_mother     = $fields->[7];
  $vl_signal_A_mother       = $fields->[8];
  $vl_signal_B_mother       = $fields->[9];
  $call_base_mother         = $fields->[10];
  $call_code_offspring      = $fields->[11];
  $tx_confidence_offspring  = $fields->[12];
  $vl_signal_A_offspring    = $fields->[13];
  $vl_signal_B_offspring    = $fields->[14];
  $call_base_offspring      = $fields->[15];     
  $dbSNP                    = $fields->[16];
  $chromosome_id            = $fields->[17];
  $position                 = $fields->[18];
  $origem_mutacao           = $fields->[19];
  $tipo_mutacao             = $fields->[20]; 
  
  @fields = ($probe_set_id,$call_code_father,$tx_confidence_father,
                   $vl_signal_A_father,$vl_signal_B_father,$call_base_father,                   
                   $call_code_mother,$tx_confidence_mother,
                   $vl_signal_A_mother,$vl_signal_B_mother,$call_base_mother,
                   $call_code_offspring,$tx_confidence_offspring,
                   $vl_signal_A_offspring,$vl_signal_B_offspring,$call_base_offspring,                   
                   $dbSNP,$chromosome_id,$position,$origem_mutacao, $tipo_mutacao
               );
  
 

  my $reg = '';
  $reg = join(',',@fields);
  
  #Entra as funções
  #&verificaGenotipo();
  #&verificaBaseNitrogenada();
  
  my $strMutacao1 = ",Mutacao Genotipica - Origem Materna ou Paterna,F08,";
  my $strMutacao3 = ",Mutacao Genotipica - Origem Materna,F08,";
  my $strMutacao4 = ",Mutacao Genotipica - Origem Paterna,F08,";
  my $strMutacao5 = ",Sem Mutacao Genotipica,F08,";  
  my $strMutacao6 = ",Inconclusivo,F08,";  
  
  
  # print ($call_code_mother);
  # print ($call_code_father);
  # print ($call_code_offspring);
  
  # if ($tx_confidence_mother gt '0.005' or $tx_confidence_offspring gt '0.005' or $tx_confidence_father gt '0.005') {
      # if (($call_code_mother ne 'NoCall') or ($call_base_mother ne '')) {
      # if ($call_base_mother ne '' or $call_base_father ne '' or $call_base_offspring ne '') {
          switch($call_code_mother) {
              case 'AA' {
                if($call_code_father eq 'AA') {            
                     if ($call_code_offspring eq 'AA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'AB') { 
                         if ($tx_confidence_father >  $tx_confidence_mother) {               
                          say $fh_log $reg, $strMutacao3;
                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                          say $fh_log $reg, $strMutacao4;
                        }elsif ($tx_confidence_father =  $tx_confidence_mother) {
                          say $fh_log $reg, $strMutacao1;
                        }                            
                     }
                     elsif ($call_code_offspring eq 'BA') {                  
                       if ($tx_confidence_father >  $tx_confidence_mother) {               
                          say $fh_log $reg, $strMutacao3;
                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                          say $fh_log $reg, $strMutacao4;
                        }elsif ($tx_confidence_father =  $tx_confidence_mother) {
                          say $fh_log $reg, $strMutacao1;
                        } 
                     }
                     elsif ($call_code_offspring eq 'BB') {                 
                       if ($tx_confidence_father >  $tx_confidence_mother) {               
                          say $fh_log $reg, $strMutacao3;
                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                          say $fh_log $reg, $strMutacao4;
                        }elsif ($tx_confidence_father =  $tx_confidence_mother) {
                          say $fh_log $reg, $strMutacao1;
                        } 
                     }
                     elsif ($call_code_offspring eq 'NoCall') {                 
                       say $fh_log $reg, $strMutacao6;
                     }
                     elsif ($call_code_offspring eq '') {                 
                       say $fh_log $reg, $strMutacao6;
                     }                     
                } # if($call_code_father)    
                elsif($call_code_father eq 'AB') {            
                     if ($call_code_offspring eq 'AA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'AB') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BB') {                 
                       say $fh_log $reg, $strMutacao3;
                     }
                     elsif ($call_code_offspring eq 'NoCall') {                 
                       say $fh_log $reg, $strMutacao6;
                     }
                     elsif ($call_code_offspring eq '') {                 
                       say $fh_log $reg, $strMutacao6;
                     }                     
                } #elsif($call_code_father = AB)
                elsif($call_code_father eq 'BA' ) {            
                     if ($call_code_offspring eq 'AA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'AB') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BB') {                 
                       say $fh_log $reg, $strMutacao3;
                     }
                     elsif ($call_code_offspring eq 'NoCall') {                 
                       say $fh_log $reg, $strMutacao6;
                     }
                     elsif ($call_code_offspring eq '') {                 
                       say $fh_log $reg, $strMutacao6;
                     }                     
                } #elsif($call_code_father = BA)
                elsif($call_code_father eq 'BB') {            
                     if ($call_code_offspring eq 'AA') {                  
                       say $fh_log $reg, $strMutacao4;
                     }
                     elsif ($call_code_offspring eq 'AB') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BB') {                 
                       say $fh_log $reg, $strMutacao3;
                     }
                     elsif ($call_code_offspring eq 'NoCall') {                 
                       say $fh_log $reg, $strMutacao6;
                     }
                     elsif ($call_code_offspring eq '') {                 
                       say $fh_log $reg, $strMutacao6;
                     }                     
                } #elsif($call_code_father = BB) 
                elsif($call_code_father eq 'NoCall') {                                                   
                     say $fh_log $reg, $strMutacao6;
                } #elsif($call_code_father = NoCall)          
                elsif ($call_code_father eq ''){
                     say $fh_log $reg, $strMutacao6;
                }
              }#case AA code_mother
                                
              case ['AB','BA'] {
                if($call_code_father eq 'AA') {            
                     if ($call_code_offspring eq 'AA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'AB') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BB') {                 
                       say $fh_log $reg, $strMutacao4;
                     }
                     elsif ($call_code_offspring eq 'NoCall') {                 
                       say $fh_log $reg, $strMutacao6;
                     } 
                     elsif ($call_code_offspring eq '') {                 
                       say $fh_log $reg, $strMutacao6;
                     }                    
                } # if($call_code_father)    
                elsif($call_code_father eq 'AB') {            
                     if ($call_code_offspring eq 'AA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'AB') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BB') {                 
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'NoCall') {                 
                       say $fh_log $reg, $strMutacao6;
                     }                     
                     elsif ($call_code_offspring eq '') {                 
                       say $fh_log $reg, $strMutacao6;
                     }
                } #elsif($call_code_father = AB)
                elsif($call_code_father eq 'BA') {            
                     if ($call_code_offspring eq 'AA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'AB') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BB') {                 
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'NoCall') {                 
                       say $fh_log $reg, $strMutacao6;
                     }       
                     elsif ($call_code_offspring eq '') {                 
                       say $fh_log $reg, $strMutacao6;
                     }              
                } #elsif($call_code_father = BA)
                elsif($call_code_father eq 'BB') {            
                     if ($call_code_offspring eq 'AA') {                  
                       say $fh_log $reg, $strMutacao4;
                     }
                     elsif ($call_code_offspring eq 'AB') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BB') {                 
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'NoCall') {                 
                       say $fh_log $reg, $strMutacao6;
                     }     
                     elsif ($call_code_offspring eq '') {                 
                       say $fh_log $reg, $strMutacao6;
                     }                
                } #elsif($call_code_father = BB) 
                elsif($call_code_father eq 'NoCall') {                                                   
                     say $fh_log $reg, $strMutacao6;
                } #elsif($call_code_father = NoCall)          
                elsif ($call_code_father eq ''){
                     say $fh_log $reg, $strMutacao6;
                }
              }#case AB ou BA code_mother  
              
              case 'BB' {
                if($call_code_father eq 'AA') {            
                     if ($call_code_offspring eq 'AA') {                  
                       say $fh_log $reg, $strMutacao3;
                     }
                     elsif ($call_code_offspring eq 'AB') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BB') {                 
                       say $fh_log $reg, $strMutacao4;
                     }
                     elsif ($call_code_offspring eq 'NoCall') {                 
                       say $fh_log $reg, $strMutacao6;
                     }  
                     elsif ($call_code_offspring eq '') {                 
                       say $fh_log $reg, $strMutacao6;
                     }                   
                } # if($call_code_father)    
                elsif($call_code_father eq 'AB') {            
                     if ($call_code_offspring eq 'AA') {                  
                       say $fh_log $reg, $strMutacao3;
                     }
                     elsif ($call_code_offspring eq 'AB') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BB') {                 
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'NoCall') {                 
                       say $fh_log $reg, $strMutacao6;
                     }      
                     elsif ($call_code_offspring eq '') {                 
                       say $fh_log $reg, $strMutacao6;
                     }               
                } #elsif($call_code_father = AB ou BA)
                elsif($call_code_father eq 'BA') {            
                     if ($call_code_offspring eq 'AA') {                  
                       say $fh_log $reg, $strMutacao3;
                     }
                     elsif ($call_code_offspring eq 'AB') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BA') {                  
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'BB') {                 
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'NoCall') {                 
                       say $fh_log $reg, $strMutacao6;
                     }
                     elsif ($call_code_offspring eq '') {                 
                       say $fh_log $reg, $strMutacao6;
                     }                     
                } #elsif($call_code_father = BA)
                elsif($call_code_father eq 'BB') {            
                     if ($call_code_offspring eq 'AA') {                  
                       if ($tx_confidence_father >  $tx_confidence_mother) {               
                          say $fh_log $reg, $strMutacao3;
                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                          say $fh_log $reg, $strMutacao4;
                        }elsif ($tx_confidence_father =  $tx_confidence_mother) {
                          say $fh_log $reg, $strMutacao1;
                        } 
                     }
                     elsif ($call_code_offspring eq 'AB') {                  
                       if ($tx_confidence_father >  $tx_confidence_mother) {               
                          say $fh_log $reg, $strMutacao3;
                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                          say $fh_log $reg, $strMutacao4;
                        }elsif ($tx_confidence_father =  $tx_confidence_mother) {
                          say $fh_log $reg, $strMutacao1;
                        } 
                     }
                     elsif ($call_code_offspring eq 'BA') {                  
                       if ($tx_confidence_father >  $tx_confidence_mother) {               
                          say $fh_log $reg, $strMutacao3;
                        }elsif ($tx_confidence_father <  $tx_confidence_mother) {
                          say $fh_log $reg, $strMutacao4;
                        }elsif ($tx_confidence_father =  $tx_confidence_mother) {
                          say $fh_log $reg, $strMutacao1;
                        } 
                     }
                     elsif ($call_code_offspring eq 'BB') {                 
                       say $fh_log $reg, $strMutacao5;
                     }
                     elsif ($call_code_offspring eq 'NoCall') {                 
                       say $fh_log $reg, $strMutacao6;
                     } 
                     elsif ($call_code_offspring eq '') {                 
                       say $fh_log $reg, $strMutacao6;
                     }                    
                } #elsif($call_code_father = BB) 
                elsif($call_code_father eq 'NoCall') {                                                   
                     say $fh_log $reg, $strMutacao6;
                } #elsif($call_code_father = NoCall)          
                elsif ($call_code_father eq ''){
                     say $fh_log $reg, $strMutacao6;
                }
              }#case BB code_mother
              case 'NoCall' {say $fh_log $reg, $strMutacao6;} #case NoCall code_mother     
              case '' {say $fh_log $reg, $strMutacao6;} #case Nulo code_mother              
          }# switch($call_code_mother) 
    #    }# if $call_base
    # }# if $call_code      
 # }# if $tx_confidence
    
}   #While
  
  
  if (not $csv->eof) {
    $csv->error_diag();
  }

close $data;
close $fh_log;

  
   
  
   
