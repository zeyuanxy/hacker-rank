import xml.etree.ElementTree as etree

def calc(root):
    ret = 0
    for child in root:
        ret += calc(child)
    ret += len(root.attrib)
    return ret

if __name__ == "__main__":
    n = int(raw_input())
    xml = ''
    for i in range(n):
        xml += raw_input()
    tree = etree.ElementTree(etree.fromstring(xml))
    print calc(tree.getroot())