export INFERENCE_ROUTE=https://$(oc get routes -n diabetes | grep diabetes-diabetes | awk '{print $2}')
export TOKEN=$(oc whoami -t)
curl -H "Authorization: Bearer $TOKEN" $INFERENCE_ROUTE/v2/models/diabetes/infer \
 -X POST \
 --data '{"inputs" : [{"name" : "dense_1_input","shape" : [ 1, 8 ],"datatype" : "FP32","data" : [ 6,148,72,35,0,33.6,0.627,50 ]}],"outputs" : [{"name" : "output0"}]}'
echo
curl -H "Authorization: Bearer $TOKEN" $INFERENCE_ROUTE/v2/models/diabetes/infer \
 -X POST \
 --data '{"inputs" : [{"name" : "dense_1_input","shape" : [ 1, 8 ],"datatype" : "FP32","data" : [ 1,85,66,29,0,26.6,0.351,31 ]}],"outputs" : [{"name" : "output0"}]}'
echo
curl -H "Authorization: Bearer $TOKEN" $INFERENCE_ROUTE/v2/models/diabetes/infer \
 -X POST \
 --data '{"inputs" : [{"name" : "dense_1_input","shape" : [ 1, 8 ],"datatype" : "FP32","data" : [ 8,183,64,0,0,23.3,0.672,32 ]}],"outputs" : [{"name" : "output0"}]}'
echo
curl -H "Authorization: Bearer $TOKEN" $INFERENCE_ROUTE/v2/models/diabetes/infer \
 -X POST \
 --data '{"inputs" : [{"name" : "dense_1_input","shape" : [ 1, 8 ],"datatype" : "FP32","data" : [ 1,89,66,23,94,28.1,0.167,21 ]}],"outputs" : [{"name" : "output0"}]}'
echo
curl -H "Authorization: Bearer $TOKEN" $INFERENCE_ROUTE/v2/models/diabetes/infer \
 -X POST \
 --data '{"inputs" : [{"name" : "dense_1_input","shape" : [ 1, 8 ],"datatype" : "FP32","data" : [ 0,137,40,35,168,43.1,2.288,33 ]}],"outputs" : [{"name" : "output0"}]}'
echo
curl -H "Authorization: Bearer $TOKEN" $INFERENCE_ROUTE/v2/models/diabetes/infer \
 -X POST \
 --data '{"inputs" : [{"name" : "dense_1_input","shape" : [ 1, 8 ],"datatype" : "FP32","data" : [ 0,0,0,0,0,0,0,0 ]}],"outputs" : [{"name" : "output0"}]}'
echo
curl -H "Authorization: Bearer $TOKEN" $INFERENCE_ROUTE/v2/models/diabetes/infer \
 -X POST \
 --data '{"inputs" : [{"name" : "dense_1_input","shape" : [ 1, 8 ],"datatype" : "FP32","data" : [ 1000,1000,1000,1000,1000,1000,1000,1000 ]}],"outputs" : [{"name" : "output0"}]}'
