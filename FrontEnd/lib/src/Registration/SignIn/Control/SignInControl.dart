class SignInControl{
  var state;
  SignInControl(this.state);

  visibiltyChange(){
    if(state.isHidden){
      state.setState(() { state.isHidden = false; });
      return ;
    }
    state.setState(() { state.isHidden = true; });
  }

  onChange(String variableName , String value){

  }


  signingIn(){

  }

  Navigate(context , destination){

  }
}