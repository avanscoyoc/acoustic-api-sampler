import os
import boto3
import requests
from typing import List, Dict, Any, Optional

def api_request(
        request,
        api_url: str,
        soundhub_api_env_key: str = 'SOUNDHUB_SESSION_TOKEN'):

    session_token = os.environ.get(soundhub_api_env_key)
    if not session_token:
        raise ValueError(f"Environment variable {soundhub_api_env_key} not set")

    cookies = {'__Secure-next-auth.session-token': session_token}
    url = f'{api_url}/{request}'

    response = requests.get(url, cookies=cookies)
    response.raise_for_status()

    return response.json()


def project_recordings(
        project_id: int,
        api_url: str,
        soundhub_api_env_key: str):
    """
    Query SoundHub API to get list of recording data.

    Args:
        project_id: Project ID to query
        api_url: Base URL for SoundHub API
        soundhub_api_env_key: Environment variable name containing session token
        printer: Optional printer for logging

    Returns:
        List of recording dictionaries
    """
    session_token = os.environ.get(soundhub_api_env_key)
    if not session_token:
        raise ValueError(f"Environment variable {soundhub_api_env_key} not set")

    cookies = {'__Secure-next-auth.session-token': session_token}
    url = f'{api_url}/projects/{project_id}/recordings/'

    if printer:
        printer.message(f'Querying API: {url}')
    print(cookies)
    response = requests.get(url, cookies=cookies)
    response.raise_for_status()

    recordings = response.json()

    if printer:
        printer.message(f'Retrieved {len(recordings)} recordings from API')

    return recordings