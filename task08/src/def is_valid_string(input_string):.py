def is_valid_string(input_str):
    peak_idx = input_str.index(max(input_str))
    return input_str[:peak_idx] == ''.join(sorted(input_str[:peak_idx])) and \
           input_str[peak_idx:] == ''.join(sorted(input_str[peak_idx:], reverse=True))

def main(file_path):
    binary_flag = ""
    
    with open(file_path, 'r') as file:
        for line in file:
            line = line.strip()  
            if is_valid_string(line):
                binary_flag += '1'
            else:
                binary_flag += '0'
    
    print(binary_flag)

if __name__ == "__main__":
    file_path = "/Users/gauthammohanraj/Desktop/data-5.txt"  
    main(file_path)
