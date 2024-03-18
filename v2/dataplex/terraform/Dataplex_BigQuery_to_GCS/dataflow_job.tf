

# Autogenerated file. DO NOT EDIT.
#
# Copyright (C) 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.
#


variable "on_delete" {
  type        = string
  description = "One of \"drain\" or \"cancel\". Specifies behavior of deletion during terraform destroy."
}

variable "project" {
  type        = string
  description = "The Google Cloud Project ID within which this module provisions resources."
}

variable "region" {
  type        = string
  description = "The region in which the created job should run."
}

variable "sourceBigQueryDataset" {
  type        = string
  description = "Dataplex asset name for the BigQuery dataset to tier data from. Format: projects/<name>/locations/<loc>/lakes/<lake-name>/zones/<zone-name>/assets/<asset name> (Dataplex asset name) or projects/<name>/datasets/<dataset-id> (BigQuery dataset ID)."

}

variable "tables" {
  type        = string
  description = "A comma-separated list of BigQuery tables to tier. If none specified, all tables will be tiered. Tables should be specified by their name only (no project/dataset prefix). Case-sensitive!"
  default     = null
}

variable "destinationStorageBucketAssetName" {
  type        = string
  description = "Dataplex asset name for the Cloud Storage bucket to tier data to. Format: projects/<name>/locations/<loc>/lakes/<lake-name>/zones/<zone-name>/assets/<asset name>."

}

variable "exportDataModifiedBeforeDateTime" {
  type        = string
  description = "Move data older than this date (and optional time). For partitioned tables, move partitions last modified before this date/time. For non-partitioned tables, move if the table was last modified before this date/time. If not specified, move all tables / partitions. The date/time is parsed in the default time zone by default, but optional suffixes Z and +HH:mm are supported. Format: YYYY-MM-DD or YYYY-MM-DDTHH:mm:ss or YYYY-MM-DDTHH:mm:ss+03:00. Relative date/time (https://en.wikipedia.org/wiki/ISO_8601#Durations) is also supported. Format: -PnDTnHnMn.nS (must start with -P meaning time in the past)."
  default     = null
}

variable "maxParallelBigQueryMetadataRequests" {
  type        = number
  description = "The maximum number of parallel requests that will be sent to BigQuery when loading table/partition metadata. Defaults to: 5."
  default     = 5
}

variable "fileFormat" {
  type        = string
  description = "Output file format in Cloud Storage. Format: PARQUET or AVRO. Defaults to: PARQUET."
  default     = null
}

variable "fileCompression" {
  type        = string
  description = "Output file compression. Format: UNCOMPRESSED, SNAPPY, GZIP, or BZIP2. BZIP2 not supported for PARQUET files. Defaults to: SNAPPY."
  default     = null
}

variable "partitionIdRegExp" {
  type        = string
  description = "Process partitions with partition ID matching this regexp only. Default: process all."
  default     = null
}

variable "writeDisposition" {
  type        = string
  description = "Specifies the action that occurs if a destination file already exists. Format: OVERWRITE, FAIL, SKIP. If SKIP, only files that don't exist in the destination directory will be processed. If FAIL and at least one file already exists, no data will be processed and an error will be produced. Defaults to: SKIP."
  default     = null
}

variable "enforceSamePartitionKey" {
  type        = bool
  description = "Whether to enforce the same partition key. Due to a BigQuery limitation, it's not possible to have a partitioned external table with the partition key (in the file path) to have the same name as one of the columns in the file. If this param is true (the default), the partition key of the target file will be set to the original partition column name and the column in the file will be renamed. If false, it's the partition key that will be renamed."
  default     = null
}

variable "deleteSourceData" {
  type        = bool
  description = "Whether to delete source data from BigQuery after a successful export. Format: true or false. Defaults to: false."
  default     = null
}

variable "updateDataplexMetadata" {
  type        = bool
  description = "Whether to update Dataplex metadata for the newly created entities. Only supported for Cloud Storage destination. If enabled, the pipeline will automatically copy the schema from source to the destination Dataplex entities, and the automated Dataplex Discovery won't run for them. Use this flag in cases where you have managed schema at the source. Defaults to: false."
  default     = null
}


provider "google" {
  project = var.project
}

provider "google-beta" {
  project = var.project
}

variable "additional_experiments" {
  type        = set(string)
  description = "List of experiments that should be used by the job. An example value is  'enable_stackdriver_agent_metrics'."
  default     = null
}

variable "autoscaling_algorithm" {
  type        = string
  description = "The algorithm to use for autoscaling"
  default     = null
}

variable "enable_streaming_engine" {
  type        = bool
  description = "Indicates if the job should use the streaming engine feature."
  default     = null
}

variable "ip_configuration" {
  type        = string
  description = "The configuration for VM IPs. Options are 'WORKER_IP_PUBLIC' or 'WORKER_IP_PRIVATE'."
  default     = null
}

variable "kms_key_name" {
  type        = string
  description = "The name for the Cloud KMS key for the job. Key format is: projects/PROJECT_ID/locations/LOCATION/keyRings/KEY_RING/cryptoKeys/KEY"
  default     = null
}

variable "labels" {
  type        = map(string)
  description = "User labels to be specified for the job. Keys and values should follow the restrictions specified in the labeling restrictions page. NOTE: This field is non-authoritative, and will only manage the labels present in your configuration.				Please refer to the field 'effective_labels' for all of the labels present on the resource."
  default     = null
}

variable "launcher_machine_type" {
  type        = string
  description = "The machine type to use for launching the job. The default is n1-standard-1."
  default     = null
}

variable "machine_type" {
  type        = string
  description = "The machine type to use for the job."
  default     = null
}

variable "max_workers" {
  type        = number
  description = "The maximum number of Google Compute Engine instances to be made available to your pipeline during execution, from 1 to 1000."
  default     = null
}

variable "name" {
  type = string
}

variable "network" {
  type        = string
  description = "The network to which VMs will be assigned. If it is not provided, 'default' will be used."
  default     = null
}

variable "num_workers" {
  type        = number
  description = "The initial number of Google Compute Engine instances for the job."
  default     = null
}

variable "sdk_container_image" {
  type        = string
  description = "Docker registry location of container image to use for the 'worker harness. Default is the container for the version of the SDK. Note this field is only valid for portable pipelines."
  default     = null
}

variable "service_account_email" {
  type        = string
  description = "The Service Account email used to create the job."
  default     = null
}

variable "skip_wait_on_job_termination" {
  type        = bool
  description = "If true, treat DRAINING and CANCELLING as terminal job states and do not wait for further changes before removing from terraform state and moving on. WARNING: this will lead to job name conflicts if you do not ensure that the job names are different, e.g. by embedding a release ID or by using a random_id."
  default     = null
}

variable "staging_location" {
  type        = string
  description = "The Cloud Storage path to use for staging files. Must be a valid Cloud Storage URL, beginning with gs://."
  default     = null
}

variable "subnetwork" {
  type        = string
  description = "The subnetwork to which VMs will be assigned. Should be of the form 'regions/REGION/subnetworks/SUBNETWORK'."
  default     = null
}

variable "temp_location" {
  type        = string
  description = "The Cloud Storage path to use for temporary files. Must be a valid Cloud Storage URL, beginning with gs://."
  default     = null
}

resource "google_project_service" "required" {
  service            = "dataflow.googleapis.com"
  disable_on_destroy = false
}

resource "google_dataflow_flex_template_job" "generated" {
  depends_on              = [google_project_service.required]
  provider                = google-beta
  container_spec_gcs_path = "gs://dataflow-templates-${var.region}/latest/flex/Dataplex_BigQuery_to_GCS"
  parameters = {
    sourceBigQueryDataset               = var.sourceBigQueryDataset
    tables                              = var.tables
    destinationStorageBucketAssetName   = var.destinationStorageBucketAssetName
    exportDataModifiedBeforeDateTime    = var.exportDataModifiedBeforeDateTime
    maxParallelBigQueryMetadataRequests = tostring(var.maxParallelBigQueryMetadataRequests)
    fileFormat                          = var.fileFormat
    fileCompression                     = var.fileCompression
    partitionIdRegExp                   = var.partitionIdRegExp
    writeDisposition                    = var.writeDisposition
    enforceSamePartitionKey             = tostring(var.enforceSamePartitionKey)
    deleteSourceData                    = tostring(var.deleteSourceData)
    updateDataplexMetadata              = tostring(var.updateDataplexMetadata)
  }

  additional_experiments       = var.additional_experiments
  autoscaling_algorithm        = var.autoscaling_algorithm
  enable_streaming_engine      = var.enable_streaming_engine
  ip_configuration             = var.ip_configuration
  kms_key_name                 = var.kms_key_name
  labels                       = var.labels
  launcher_machine_type        = var.launcher_machine_type
  machine_type                 = var.machine_type
  max_workers                  = var.max_workers
  name                         = var.name
  network                      = var.network
  num_workers                  = var.num_workers
  sdk_container_image          = var.sdk_container_image
  service_account_email        = var.service_account_email
  skip_wait_on_job_termination = var.skip_wait_on_job_termination
  staging_location             = var.staging_location
  subnetwork                   = var.subnetwork
  temp_location                = var.temp_location
  region                       = var.region
}

output "dataflow_job_url" {
  value = "https://console.cloud.google.com/dataflow/jobs/${var.region}/${google_dataflow_flex_template_job.generated.job_id}"
}
