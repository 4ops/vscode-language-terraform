# --- Clear look

provider "google" {
  alias   = "west"
  version = "~> 1.0"
  project = "acme-app"
  region  = "us-central1"
}

# --- Test strings

  provider}{}                    # not valid
  provider/**/"tls"{}            # valid
  providera"tls"/**/{}           # not valid
  /**/provider"null"{}           # valid
provider"local"{} /** asd*/      # valid
q provider "random"{}            # not valid
 provider  "42abc"/*sdf*/ {  }   # not valid
 provider   "abc42" { /*sdf*/    # valid

                              }  # valid

            provider   "a"   {   # valid
 version""           /** sdf*/   # not valid
    version=""                   # not valid
  version=    "111"        #     # valid
   version="1.11"                # valid
   version   =">=1.11.11-rc0"    # valid
     version="  \"   $asd   "    # not valid

version=    "# >=  #    # 0.12.0 # valid
version= ()    ttt " >= 0.12.0 " # not valid
    version= >=0.12.0"       //  # not valid
  version== ">>6.6.6"            # not valid
fversion            =">=0.12.0"  # not valid
 fff version         =">=0.12.0" # not valid
            }                    # valid
