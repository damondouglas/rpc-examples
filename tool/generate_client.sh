rpc=$(pub global list | grep rpc)
if pub global list | grep -q rpc
then
  echo "Using $rpc..."
else
  pub global activate rpc
fi

rm -rf json && mkdir json
pub global run rpc:generate discovery -i lib/toyapi.dart > json/toyapi.json

gen=$(pub global list | grep discoveryapis_generator)
if pub global list | grep -q discoveryapis_generator
then
  echo "Using $gen..."
else
  pub global activate discoveryapis_generator
fi

rm -rf client && mkdir client
pub global run discoveryapis_generator:generate package -i json -o client --package-name=toyapi
cd client
pub get
