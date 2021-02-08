import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:onecaintamobileapp/apilist/endpoints.dart';

class JobsOpeningModel {
  String jobID;
  String jobHeadline;
  int jobSalaryLow;
  int jobSalaryHigh;
  String jobDescText;
  String jobDatePosting;
  String jobImg;
  bool isActive;

  JobsOpeningModel(
      {this.jobID,
      this.jobHeadline,
      this.jobSalaryLow,
      this.jobSalaryHigh,
      this.jobDescText,
      this.jobDatePosting,
      this.jobImg,
      this.isActive});

  JobsOpeningModel.fromJson(Map<String, dynamic> json) {
    jobID = json['JobID'];
    jobHeadline = json['JobHeadline'];
    jobSalaryLow = json['JobSalaryLow'];
    jobSalaryHigh = json['JobSalaryHigh'];
    jobDescText = json['JobDescText'];
    jobDatePosting = json['JobDatePosting'];
    jobImg = json['JobImg'];
    isActive = json['IsActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['JobID'] = this.jobID;
    data['JobHeadline'] = this.jobHeadline;
    data['JobSalaryLow'] = this.jobSalaryLow;
    data['JobSalaryHigh'] = this.jobSalaryHigh;
    data['JobDescText'] = this.jobDescText;
    data['JobDatePosting'] = this.jobDatePosting;
    data['JobImg'] = this.jobImg;
    data['IsActive'] = this.isActive;
    return data;
  }
}

Future<List<JobsOpeningModel>> fetchJobs() async {

  
    final response = await http.get(Endpoints.jobsEndpoint,
    headers: {"Accept": "application/json"}, ).timeout(Duration(seconds: 60))
    .catchError((e){
          throw Exception('Loading errored in getting jobs, please try again.');
    });

    if ( response != null && response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((news) => new JobsOpeningModel.fromJson(news)).toList();
    } else {
    
    throw Exception('Loading errored in getting jobs, please try again.');
   
    }
  }
