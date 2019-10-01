find . -name "*.pbxproj"|while read fname; do
  echo "$fname"
  ./build/Release/xprojstep "$fname" --ouput test.pbxproj --format openstep
  status=$?
  echo $status
  if [[ $fname == *"/ko/"* ]];then
      if [[ $status -eq 1 ]];then
         echo "ok, must failed"
      else
         echo "ko"
         exit 1
      fi
  else
      if [[ $status -eq 0 ]];then
         echo "ok"
      else
         echo "ko"
         exit 1
      fi
  fi
done
