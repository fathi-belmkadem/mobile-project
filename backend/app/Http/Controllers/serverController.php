<?php

namespace App\Http\Controllers;
use InfluxDB2;
use DateTime;
use App\Http\Controllers\API\BaseController;
use Illuminate\Http\Request;
Use InfluxDB2\Client;
Use InfluxDB2\Model;
use InfluxDB2\Model\Query;
use InfluxDB2\Point;
use InfluxDB2\WriteType as WriteType;

class serverController extends Controller
{
    public function sendResponse($result, $message)
    {
    	$response = [
            'success' => true,
            'data'    => $result,
            'message' => $message,
        ];


        return response()->json($response, 200);
    }

    /**
     * return error response.
     *
     * @return \Illuminate\Http\Response
     */
    public function sendError($error, $errorMessages = [], $code = 404)
    {
    	$response = [
            'success' => false,
            'message' => $error,
        ];


        if(!empty($errorMessages)){
            $response['data'] = $errorMessages;
        }


        return response()->json($response, $code);
    }
    public function index(Request $request, $mesurment)
    {
        $latest=$request->latest=="true";
        $mesurments=[
            "precipitations" => "device_frmpayload_data_analoginput_0",
            "pressure" => "device_frmpayload_data_barometer_4",
            "humidity" => "device_frmpayload_data_humiditySensor_2",
            "luminosity" => "device_frmpayload_data_illuminanceSensor_1",
            "temperature" => "device_frmpayload_data_temperatureSensor_3"
        ];

        $token = 'hChb_sDWSnXG7zoLU6l-GbyMUdWmIkSsZYrGjfb9UK-INuKOv6FsTI0bcE7yEMixMJeuBugLku9uGT_kQFzxiA==';
        $org = 'SWALP';
        $bucket = 'Weather_Station_Bucket';

        $client = new InfluxDB2\Client([
            "url" => "http://52.51.92.31:8086",
            "token" => $token,
            "bucket" => $bucket,
            "org" => $org,
            "precision" => InfluxDB2\Model\WritePrecision::NS,
        ]);

        $queryApi = $client->createQueryApi();

        if($latest)
        {
            $query = "from(bucket: \"$bucket\")
            |> range(start:1640995200)
            |> last()
            |> filter(fn: (r) => r._measurement == \"$mesurments[$mesurment]\")
            ";
        }
        else
        {
            $start=$request->start;
            $limit=$request->limit;
            $query = "from(bucket: \"$bucket\")
            |> range(start:$start)
            |> limit(n:$limit)
            |> filter(fn: (r) => r._measurement == \"$mesurments[$mesurment]\")
            ";
        }

        $tables = $queryApi->query($query, $org);

        $records = [];
        foreach ($tables as $table) {
            foreach ($table->records as $record) {
                $dt=$record->getTime();
                $dateTime=(new DateTime($dt))->format('Y-m-d H:i:s');
                $records[$dateTime] = $record->getValue();
            }
        }
        return $this->sendResponse($records, 'Data retrieved successfully.');
    }
}
