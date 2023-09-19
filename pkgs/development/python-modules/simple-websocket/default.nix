{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, wheel
, wsproto
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "simple-websocket";
  version = "0.9.0";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "miguelgrinberg";
    repo = "simple-websocket";
    rev = "v${version}";
    hash = "sha256-pGPHS3MbDZgXBOtsZ87ULlkGdHHfaOSDLTNN4l5wKhE=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [
    wsproto
  ];

  pythonImportsCheck = [ "simple_websocket" ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  meta = with lib; {
    description = "Simple WebSocket server and client for Python";
    homepage = "https://github.com/miguelgrinberg/simple-websocket";
    changelog = "https://github.com/miguelgrinberg/simple-websocket/blob/${src.rev}/CHANGES.md";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
