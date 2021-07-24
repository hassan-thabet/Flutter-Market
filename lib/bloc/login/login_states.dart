

abstract class LoginStates {}

class LoginInitialState extends LoginStates{}
class LoginSuccessState extends LoginStates{}
class LoginErrorState extends LoginStates{}
class LoginEmptyState extends LoginStates{}


class LoginVisibilityState extends LoginStates{}
class LoginChangeVisibilityState extends LoginStates{}