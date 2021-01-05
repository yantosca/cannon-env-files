#!/usr/bin/perl -w

#------------------------------------------------------------------------------
#                  GEOS-Chem Global Chemical Transport Model                  !
#------------------------------------------------------------------------------
#BOP
#
# !IROUTINE: job_depend.pl
#
# !DESCRIPTION: Submits several jobs to the SLURM scheduler, such that
#  each job will wait for the previous job to be done.  Handy for
#  submitting stages of long model runs.
#\\
#\\
# !REMARKS:
#  Add the job script names to the @jobs array.
#
# !REVISION HISTORY:
#  16 Mar 2018 - R. Yantosca - Initial version
#EOP
#------------------------------------------------------------------------------
#BOC
#
# !LOCAL VARIABLES:
#

# Scalars
my $count   = 0;

# Strings
my $depend = "";
my $result = "";
my $job    = "";
my $jobId  = "";

# Arrays
my @subStr = ();
my @jobs   = qw/run_geos_chem.01
                run_geos_chem.02
                run_geos_chem.03/;

# Loop over jobs
foreach $job ( @jobs ) {

  # Add the dependency string after the first job is submitted
  # (On the first pass, it's a blank string)
  if ( $count > 0 ) { $depend = "--dependency=afterok:$jobId "; }

  # Submit the job
  $cmd    = "sbatch $depend $job";
  print "$cmd\n";
  $result = qx/$cmd/;
  print "$result\n";

  # The job ID Is the last substring 
  @subStr = split( ' ', $result );
  $jobId  = $subStr[3];
  
  # Increment count
  $count++;
}

exit( $? );
